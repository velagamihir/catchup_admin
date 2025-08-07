import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:geeresolve/introduction_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset('assets/images/favicon.png'),
        nextScreen: IntroductionScreen(),
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: 600.0,
        duration: 2500,
      ),
    );
  }
}
