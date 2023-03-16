// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import '/config/amplifyconfiguration.dart';
import '/login/create_acount_form.dart';
import '/login/login_form.dart';

class AuthTabsContaner extends StatefulWidget {
  const AuthTabsContaner({super.key, required this.title});

  // Fields in a Widget subclass are always marked "final".
  final String title;

  @override
  State<AuthTabsContaner> createState() => _AuthTabsContanerState();
}

class _AuthTabsContanerState extends State<AuthTabsContaner> {
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
    return x;
  }

  bool signedIn = false;

  @override
  Widget build(BuildContext context) {
    // Test

    // ...
    String signInText = 'Sign In';
    String signUpText = 'Create Account';

    return signedIn == false
        ? MaterialApp(
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
                      LoginForm(title: signInText),
                      CreateAccountForm(title: signUpText),
                    ],
                  ),
                )),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            home: PicListPage(),
            title: 'Title goes here...',
          );
  }
}

class PicListPage extends StatelessWidget {
  const PicListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pics List View")),
      body: ListView.builder(
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ListTile(
              title: Text('Tile $index'),
              leading: Hero(
                tag: index,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 16, 4, 0),
                  child: Image.network(_images[index],
                      width: 100, fit: BoxFit.cover),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PicDetailPage(heroTag: index)));
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Sign Out',
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.question_answer)),
    );
  }
}

class PicDetailPage extends StatelessWidget {
  final int heroTag;
  const PicDetailPage({super.key, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pics List View Detail")),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Hero(
                  tag: heroTag,
                  child: Image.network(_images[heroTag]),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Content goes here...",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}

final List<String> _images = [
  'https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  'https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/273935/pexels-photo-273935.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/1591373/pexels-photo-1591373.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/462024/pexels-photo-462024.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
];
