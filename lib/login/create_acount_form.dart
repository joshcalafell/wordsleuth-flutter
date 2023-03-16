import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key, required this.title});

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  // ignore: unused_field
  bool _isSignUpComplete = false;

  bool _passwordVerifyVisible = false;
  bool _passwordNewVisible = false;

  final _createAccountFormKey = GlobalKey<FormState>();

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

  Future<void> signUpUser(String email, String username, String phoneNumber,
      String password) async {
    safePrint('$email, $username, $phoneNumber, $password');
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: email,
        CognitoUserAttributeKey.phoneNumber: phoneNumber, // '+15559101234',
      };
      final result = await Amplify.Auth.signUp(
        username: username,
        password: password,
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
    return Form(
      key: _createAccountFormKey,
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  const Text(
                    'Sign up for an account',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                          labelText: 'Email'),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else {
                          safePrint('Value $value');
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Username',
                          labelText: 'Username'),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        } else {
                          safePrint('Value $value');
                        }
                        return null;
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          } else {
                            safePrint('Value $value');
                          }
                          return null;
                        },
                        obscureText: !_passwordNewVisible,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'New Password',
                            labelText: 'New Password',
                            suffixIcon: IconButton(
                              onPressed: _toggleNewPasswordVisible,
                              icon: Icon(_passwordVerifyVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              // The validator receives the text that the user has entered.
                            )))),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please verify your password';
                          } else {
                            safePrint('Value $value');
                          }
                          return null;
                        },
                        obscureText: _passwordVerifyVisible,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Confirm Password',
                            labelText: 'Confirm Password',
                            suffixIcon: IconButton(
                              onPressed: _togglePasswordVerifyVisible,
                              icon: Icon(_passwordVerifyVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              // The validator receives the text that the user has entered.
                            )))),
                MaterialButton(
                  minWidth: double.tryParse('340'),
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_createAccountFormKey.currentState!.validate()) {
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
                    'Create Account',
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
              ]),
            ],
          )
        ],
      ),
    );
  }
}
