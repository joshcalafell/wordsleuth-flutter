// ignore_for_file: prefer_const_constructors
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:word_sleuth/login/forms/form_create_acount.dart';
import 'package:word_sleuth/login/forms/form_login_account.dart';

import '/config/amplifyconfiguration.dart';

class TabsAuth extends StatefulWidget {
  const TabsAuth({super.key, required this.title});

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<TabsAuth> createState() => _TabsAuthState();
}

class _TabsAuthState extends State<TabsAuth> {
  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    final authPlugin = AmplifyAuthCognito();
    await Amplify.addPlugin(authPlugin);

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  Future<bool> isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    return result.isSignedIn;
  }

  Future<AuthUser> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    return user;
  }

  // ignore: unused_element

  @override
  Widget build(BuildContext context) {
    // Test

    // ...
    String signInText = 'Sign In';
    String signUpText = 'Create Account';

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Text(signInText)),
                  Tab(icon: Text(signUpText)),
                ],
              ),
            ),
            body: TabBarView(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                FormLoginAccount(title: signInText),
                FormCreateAccount(title: signUpText),
              ],
            ),
          )),
    );
  }
}
