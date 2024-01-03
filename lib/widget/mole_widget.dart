import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_animations/animation_builder/loop_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';
import 'package:supercharged/supercharged.dart';

class Mole extends StatefulWidget {
  const Mole({super.key});

  @override
  State<Mole> createState() => _MoleState();
}

class _MoleState extends State<Mole> {
  final List<MoleParticle> particles = [];
  bool _moleIsVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(2200.milliseconds, () {
      print('delayed');
      _hitMole();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Container(
      width: 100,
      height: 100,
      child: _buildMole(),
    );
  }

  Widget _buildMole() {
    print('buildMole');
    _manageParticleLifecycle();
    return LoopAnimationBuilder<int>(
      tween: ConstantTween(1),
      duration: Duration(seconds: 1),
      builder: (context, child, value) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            ...particles.map((it) => it.buildWidget())
          ],
        );
      },
    );
  }

  Widget _mole() {
    return Container(
      decoration: BoxDecoration(
          color: XFColors.primaryValue,
          borderRadius: BorderRadius.circular(50)),
    );
  }

  _hitMole() {
    Iterable.generate(50).forEach((i) => particles.add(MoleParticle()));
  }

  _manageParticleLifecycle() {
    particles.removeWhere((particle) {
      return particle.progress() == 1;
    });
  }

  void _setMoleVisible(bool visible) {
    setState(() {
      _moleIsVisible = visible;
    });
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}

enum _MoleProps { x, y, scale }

class MoleParticle {
  late Animatable<Movie> tween;
  late Duration startTime;
  final duration = 2000.milliseconds;

  MoleParticle() {
    final random = Random();
    double x = (100 + 200) * random.nextDouble() * (random.nextBool() ? 1 : -1);
    double y = (100 + 200) * random.nextDouble() * (random.nextBool() ? 1 : -1);

    tween = MovieTween()
      ..tween(_MoleProps.x, Tween(begin: 0.0, end: x), duration: 2.seconds)
      ..tween(_MoleProps.y, Tween(begin: 0.0, end: y), duration: 2.seconds)
      ..tween(_MoleProps.scale, Tween(begin: 1.0, end: 0.0),
          duration: 2.seconds);

    startTime = DateTime.now().duration();
  }

  Widget buildWidget() {
    final Movie values = tween.transform(progress());
    var alpha = (255 * progress()).toInt();
    return Positioned(
      left: values.get(_MoleProps.x),
      top: values.get(_MoleProps.y),
      child: Transform.scale(
        scale: values.get(_MoleProps.scale),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: XFColors.primaryValue.withAlpha(alpha),
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }

  double progress() {
    return ((DateTime.now().duration() - startTime) / duration)
        .clamp(0.0, 1.0)
        .toDouble();
  }
}
