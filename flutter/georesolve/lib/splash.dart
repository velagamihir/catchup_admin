import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:georesolve/login.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: 'assets/images/favicon.png',
        splashIconSize: 500.0,
        nextScreen: Login(),
        splashTransition: SplashTransition.scaleTransition,
        animationDuration: Duration(seconds: 15),
      ),
    );
  }
}
