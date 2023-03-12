import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key, required this.title});

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  // ignore: unused_field
  bool _isSignUpComplete = false;

  bool _passwordVerifyVisible = false;
  bool _passwordNewVisible = false;

  final _signInForm = {};

  @override
  initState() {
    super.initState();
  }

  void _toggleNewPasswordVisible() {
    setState(() {
      _passwordNewVisible = !_passwordNewVisible;
    });
  }

  void _togglePasswordVerifyVisible() {
    setState(() {
      _passwordVerifyVisible = !_passwordVerifyVisible;
    });
  }

  void _updateSignInForm(typedata, text) {
    setState(() {
      _signInForm[typedata] = text;
    });
  }

  Future<void> signUpUser() async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: 'email@domain.com',
        CognitoUserAttributeKey.phoneNumber: '+15559101234',
      };
      final result = await Amplify.Auth.signUp(
        username: 'myusername',
        password: 'mysupersecurepassword',
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      setState(() {
        _isSignUpComplete = result.isSignUpComplete;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
            const Text(
              'Sign up for an account',
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
                _updateSignInForm("chooseUsername", text);
                safePrint('Chosen Username: $_signInForm["chooseUsername"]');
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Userame',
                  labelText: 'Username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              onChanged: (text) {
                _updateSignInForm("choosePassword", text);
                safePrint('Chosen Password: $_signInForm["choosePassword"]');
              },
              obscureText: _passwordNewVisible,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(_passwordNewVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: _toggleNewPasswordVisible),
                  hintText: 'New Password',
                  labelText: 'New Password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              onChanged: (text) {
                _updateSignInForm("confirmedPassword", text);
                safePrint(
                    'Confirmed Password: $_signInForm["confirmedPassword"]');
              },
              obscureText: _passwordVerifyVisible,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      icon: Icon(_passwordVerifyVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: _togglePasswordVerifyVisible),
                  hintText: 'Password',
                  labelText: 'Verify Password'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          MaterialButton(
            minWidth: double.tryParse('340'),
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            onPressed: () {},
            color: Colors.deepPurple,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text(
              'Create Account',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          ),
        ]),
      ],
    );
  }
}
