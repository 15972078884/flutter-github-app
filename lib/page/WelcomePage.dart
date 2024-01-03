import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/style.dart';
import 'package:flutter_github_app/widget/mole_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/';

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');

    Future.delayed(const Duration(milliseconds: 2000), () {

    });
  }

  @override
  Widget build(BuildContext context) {
    double size = 200;
    return Material(
      child: Container(
        color: XFColors.white,
        child: Stack(
          children: [
            Image.asset('static/images/welcome.png'),
            Align(
                alignment: const Alignment(0.0, 0.3),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 30.sp, color: XFColors.primaryDarkValue),
                )),
            const Align(
              alignment: Alignment(0.0, 0.8),
              child: Mole(),
            ),
            Align(
              alignment: const Alignment(0.0, .9),
              child: SizedBox(
                width: size,
                height: size,
                child: const RiveAnimation.asset('static/file/launch.riv'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
