import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:word_sleuth/amplifyconfiguration.dart';
import 'auth_wrapper.dart';

import 'package:amplify_api/amplify_api.dart';
import 'package:word_sleuth/models/ModelProvider.dart';

void main() {
  runApp(const MyApp());
  _configureAmplify();
}

Future<void> _configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
    AmplifyAPI(modelProvider: ModelProvider.instance)
  ]);
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    safePrint(
        'Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthWrapper(title: 'Word Sleuth'),
    );
  }
}
