import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class FormVerifyAccount extends StatefulWidget {
  const FormVerifyAccount({super.key, required this.title});

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<FormVerifyAccount> createState() => _FormVerifyAccountState();
}

class _FormVerifyAccountState extends State<FormVerifyAccount> {
  String username = '';
  String code = '';

  bool _isSignUpComplete = false;

  bool _passwordVerifyVisible = false;
  bool _passwordNewVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
  }

  Future<void> confirmUser(String username, String confirmationCode) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          username: username, confirmationCode: confirmationCode);
      setState(() {
        _isSignUpComplete = result.isSignUpComplete;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isSignUpComplete) {
      return Form(
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
                      'Verify your account',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please verify your 6 digit code';
                            } else {
                              code = value;
                              safePrint('Value $value');
                            }
                            return null;
                          },
                          obscureText: !_passwordNewVisible,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Code',
                            labelText: 'Code',
                          ))),
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                        confirmUser(username, code);
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
    } else {
      return Row(
        children: [
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Center(child: Text('Sign Up is Complete')),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              MaterialButton(
                minWidth: double.tryParse('340'),
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                onPressed: () {},
                color: Colors.deepPurple,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Text(
                  'Go Back',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
