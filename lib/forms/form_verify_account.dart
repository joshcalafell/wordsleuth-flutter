import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:word_sleuth/auth_wrapper.dart';

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

  // ignore: unused_field
  bool _isSignUpComplete = false;

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
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: Scaffold(
            appBar: AppBar(title: const Text('Word sleuth')),
            body: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  const Text(
                    'Confirm your account',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Username',
                            labelText: 'Username'),
                        keyboardType: TextInputType.text,
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
                              return 'Please enter your confirmation code';
                            } else {
                              code = value;
                              safePrint('Value $value');
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Confirmation Code',
                            labelText: 'Confirmation Code',
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
                          confirmUser(username, code).then((value) =>
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const AuthWrapper(
                                          title: 'Word Sleuth')),
                                  (route) => false));
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
                      child: const Text('Create Account',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          )))
                ])),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  Navigator.of(context).pop();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Going back...')),
                  );
                },
                tooltip: 'Go back',
                backgroundColor: Colors.deepPurple,
                child: const Icon(Icons.logout))));
  }
}
