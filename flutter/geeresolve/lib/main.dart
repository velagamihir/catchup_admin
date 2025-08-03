import 'package:flutter/material.dart';
import 'package:geeresolve/home_page.dart';
import 'package:geeresolve/introduction_screen.dart';
import 'package:geeresolve/login.dart';
import 'package:geeresolve/splash.dart';
import 'package:geeresolve/student_login.dart';
import 'package:geeresolve/student_register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => Splash(),
        '/main': (context) => Login(),
        '/login': (context) => StudentLogin(),
        '/register':(context)=>StudentRegister(),
        '/home':(context)=>HomePage(),
        '/introduction':(context)=>IntroductionScreen(),
      },
    );
  }
}
