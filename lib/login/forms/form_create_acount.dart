import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:word_sleuth/login/forms/form_verify_account.dart';

class FormCreateAccount extends StatefulWidget {
  const FormCreateAccount({super.key, required this.title});

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<FormCreateAccount> createState() => _FormCreateAccountState();
}

class _FormCreateAccountState extends State<FormCreateAccount> {
  String username = '';
  String phoneNumber = '+13335557777';
  String emailAddress = '';
  String password1 = '';
  String password2 = '';

  // ignore: unused_field
  bool _isSignUpComplete = false;

  bool _passwordVerifyVisible = false;
  bool _passwordNewVisible = false;

  final _formKey = GlobalKey<FormState>();

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

  Future<void> signUpUser(String email, String phoneNumber, String username,
      String password) async {
    safePrint('$email, $phoneNumber, $username,  $password');
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
      safePrint(result.isSignUpComplete
          ? 'Sign up Complete 🚀'
          : 'Sign up is not complete 👎');
      safePrint(result);
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<void> confirmUser(String username, String confirmationCode) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: username, confirmationCode: confirmationCode);
      setState(() {
        _isSignUpComplete = result.isSignUpComplete;
      });
      safePrint(result.isSignUpComplete);
      safePrint(result);
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                            labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else {
                            emailAddress = value;
                            safePrint('Value $value');
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Username',
                            labelText: 'Username'),
                        keyboardType: TextInputType.emailAddress,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          } else {
                            username = value;
                            safePrint('Value $value');
                          }
                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Phone Number',
                            labelText: 'Phone Number'),
                        keyboardType: TextInputType.phone,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phoneNumber';
                          } else {
                            // phoneNumber = value;
                            safePrint('Value $phoneNumber');
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
                              return 'Please choose a password';
                            } else {
                              password1 = value;
                              safePrint('Value $value');
                            }
                            return null;
                          },
                          obscureText: !_passwordNewVisible,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'New Password',
                              labelText: 'New Password',
                              suffixIcon: IconButton(
                                onPressed: _toggleNewPasswordVisible,
                                icon: Icon(!_passwordNewVisible
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
                              return 'Please confirm your password';
                            } else if (password1.toString() !=
                                value.toString()) {
                              return 'Passwords do not match';
                            } else {
                              password2 = value;
                              safePrint('Value $value');
                            }
                            return null;
                          },
                          obscureText: !_passwordVerifyVisible,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'Confirm Password',
                              labelText: 'Confirm Password',
                              suffixIcon: IconButton(
                                onPressed: _togglePasswordVerifyVisible,
                                icon: Icon(!_passwordVerifyVisible
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        if (password1 == password2) {
                          signUpUser(emailAddress, phoneNumber, username,
                                  password2)
                              .then((value) => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const FormVerifyAccount(
                                              title: 'Form Verify Account'))));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Passwords do not match')),
                          );
                        }
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
      ),
    );
  }
}
