import 'package:flutter/material.dart';
import 'package:geeresolve/home_page.dart';
import 'package:geeresolve/introduction_screen.dart';
import 'package:geeresolve/login.dart';
import 'package:geeresolve/splash.dart';
import 'package:geeresolve/student_login.dart';
import'package:supabase_flutter/supabase_flutter.dart';
import 'package:geeresolve/student_register.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://aqdcwwdcgvpdouybuzzz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxZGN3d2RjZ3ZwZG91eWJ1enp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI0NzEwMTAsImV4cCI6MjA2ODA0NzAxMH0.Lm9mRpYLZR7P1OJK1EnKXS2ReE4vnNdIStugGzeo9mU',
  );

  runApp(MyApp());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

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
