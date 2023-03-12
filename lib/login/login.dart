import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: unused_field
  bool _isSignUpComplete = false;
  // ignore: unused_field
  final bool _isSignedIn = false;

  // Temp
  bool _isLoggedIn = false;
  bool _passwordVisible = false;

  final _signInForm = {};

  @override
  initState() {
    super.initState();
  }

  void _togglePasswordVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _toggleLoggedIn() {
    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
  }

  void _updateSignInForm(typedata, text) {
    setState(() {
      _signInForm[typedata] = text;
    });
  }

  Future<void> signInUser(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
        options: CognitoSignInOptions(
            authFlowType: AuthenticationFlowType.customAuth),
      );
      safePrint(result);
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<void> confirmUser() async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: 'myusername', confirmationCode: '123456');
      setState(() {
        _isSignUpComplete = result.isSignUpComplete;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
          const Text(
            'Sign in to your account',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
        ],
      ),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TextField(
            onChanged: (text) {
              _updateSignInForm("username", text);
              safePrint('Username: $_signInForm["username"]');
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
                labelText: 'Username'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TextField(
            onChanged: (text) {
              _updateSignInForm("password", text);
              safePrint('Password: $_signInForm["password"]');
            },
            obscureText: _passwordVisible,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                    icon: Icon(_passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: _togglePasswordVisible),
                hintText: 'Password',
                labelText: 'Password'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        MaterialButton(
          minWidth: double.tryParse('340'),
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          onPressed: _toggleLoggedIn,
          color: Colors.deepPurple,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Text(
            _isLoggedIn ? 'Sign Out' : 'Sign In',
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        Text(
          'Forgot Password?',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
      ]),
    ]);
  }
}
