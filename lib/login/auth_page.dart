// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import '/config/amplifyconfiguration.dart';
import '/login/create_account.dart';
import '/login/login.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key, required this.title});

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
  _checkAuthStatus() async {
    var x = await isUserSignedIn();
    safePrint(x);
  }

  @override
  Widget build(BuildContext context) {
    // Test
    _checkAuthStatus();
    // ...
    String signInText = 'Sign In';
    String signUpText = 'Create Account';

    safePrint(' ~~~ Fin ~~~');
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
                LoginPage(title: 'Sign In'),
                CreateAccountPage(title: 'Create Account'),
              ],
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {},
                tooltip: 'Questions',
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.question_answer)),
          )),
    );
  }
}
