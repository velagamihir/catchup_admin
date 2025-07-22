import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geeresolve/login.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/favicon.png',
      splashIconSize: 600.0,
      splashTransition: SplashTransition.scaleTransition,
      duration: 2500,
      nextScreen: Login(),
    );
  }
}
