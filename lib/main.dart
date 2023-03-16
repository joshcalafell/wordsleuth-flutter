import 'package:flutter/material.dart';
import 'login/auth_tabs_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthTabsContaner(title: 'Word Sleuth'),
    );
  }
}
