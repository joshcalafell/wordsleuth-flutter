// Do not forget to import the following for StreamSubscription
import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:word_sleuth/pages/page_pics_list.dart';

class FormLoginAccount extends StatefulWidget {
  const FormLoginAccount({super.key, required this.title});

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<FormLoginAccount> createState() => _FormLoginAccountState();
}

class _FormLoginAccountState extends State<FormLoginAccount> {
  String username = '';
  String password = '';

  bool isSignedIn = false;

  bool passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    safePrint('initState()');
  }

  void _togglePasswordVisible() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  Future<void> signInUser(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
        options: CognitoSignInOptions(
            authFlowType: AuthenticationFlowType.userSrpAuth),
      );
      safePrint(
          result.isSignedIn ? 'User is signed in' : 'User is not signed in');
      setState(() {
        isSignedIn = result.isSignedIn;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<void> signOutUser() async {
    try {
      final result = await Amplify.Auth.signOut();
      safePrint('Sign out result: $result');
      setState(() {
        isSignedIn = false;
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<bool> isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    return result.isSignedIn;
  }

  StreamSubscription<HubEvent> hubSubscription =
      Amplify.Hub.listen([HubChannel.Auth], (hubEvent) {
    switch (hubEvent.eventName) {
      case 'SIGNED_IN':
        safePrint('USER IS SIGNED IN');
        break;
      case 'SIGNED_OUT':
        safePrint('USER IS SIGNED OUT');
        break;
      case 'SESSION_EXPIRED':
        safePrint('SESSION HAS EXPIRED');
        break;
      case 'USER_DELETED':
        safePrint('USER HAS BEEN DELETED');
        break;
      default:
        safePrint(hubEvent.eventName);
        break;
    }
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  Center(
                      child: Image.asset(
                          'assets/graphics/wordsleuth_350x350_dark.png')),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          } else {
                            username = value;
                            safePrint('Value $value');
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Username',
                            labelText: 'Username'),
                        keyboardType: TextInputType.text)),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else {
                          password = value;
                          safePrint('Value $value');
                        }
                        return null;
                      },
                      obscureText: !passwordVisible,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Password',
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: _togglePasswordVisible,
                            icon: Icon(!passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            // The validator receives the text that the user has entered.
                          )),
                      keyboardType: TextInputType.visiblePassword,
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                MaterialButton(
                  minWidth: double.tryParse('340'),
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      signInUser(username, password).then((value) => {
                            if (isSignedIn)
                              {
                                // Your navigation code
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const PagePicsList()))
                              }
                            else
                              {}
                          });
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
            ])),
      ],
    );
  }
}
