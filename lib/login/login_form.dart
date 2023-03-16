import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.title});

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // ignore: unused_field
  final bool _isSignedIn = false;

  // Temp

  bool _passwordVisible = false;

  final _loginFormKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
  }

  void _togglePasswordVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
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

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _loginFormKey,
        child: Column(children: <Widget>[
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
              Center(
                  child: Image.asset(
                      'assets/graphics/wordsleuth_350x350_dark.png'))
            ],
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please verify your email';
                      } else {
                        safePrint('Value $value');
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                        labelText: 'Username'))),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please verify your password';
                      } else {
                        safePrint('Value $value');
                      }
                      return null;
                    },
                    obscureText: _passwordVisible,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                        suffixIcon: IconButton(
                          onPressed: _togglePasswordVisible,
                          icon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          // The validator receives the text that the user has entered.
                        )))),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            MaterialButton(
              minWidth: double.tryParse('340'),
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_loginFormKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              color: Colors.deepPurple,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            Text(
              'Forgot Password?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            ),
          ]),
        ]));
  }
}
