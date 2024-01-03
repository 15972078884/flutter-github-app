import 'package:flutter/material.dart';
import 'package:flutter_github_app/page/WelcomePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlutterApp extends StatefulWidget {
  const FlutterApp({super.key});

  @override
  State<FlutterApp> createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSize = mediaQueryData.size;
    print(screenSize.width * mediaQueryData.devicePixelRatio);
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: screenSize.width * mediaQueryData.devicePixelRatio,
            maxHeight: screenSize.height * mediaQueryData.devicePixelRatio),
        designSize: const Size(1080, 1920));

    return MaterialApp(
      routes: {WelcomePage.routeName: (context) => const WelcomePage()},
    );
  }
}
