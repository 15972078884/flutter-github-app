import 'package:flutter/material.dart';
import 'package:flutter_github_app/page/WelcomePage.dart';

class FlutterApp extends StatefulWidget {
  const FlutterApp({super.key});

  @override
  State<FlutterApp> createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {WelcomePage.routeName: (context) => const WelcomePage()},
    );
  }
}
