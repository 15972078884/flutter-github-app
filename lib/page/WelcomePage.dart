import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/style.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/';

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: XFColors.white,
        child: Stack(
          children: [
            Image.asset('static/images/welcome.png'),
            Align(
              alignment: Alignment(0.0, 0.3),
              child: const Text('Welcome！'),
            )
          ],
        ),
      ),
    );
  }
}
