import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geeresolve/authority/authority_login.dart';
import 'package:geeresolve/authority/authority_register.dart';
import 'package:geeresolve/citizen/citizen_dashboard.dart';
import 'package:geeresolve/citizen/citizen_login.dart';
import 'package:geeresolve/citizen/citizen_problem.dart';
import 'package:geeresolve/citizen/search_authorities.dart';
import 'package:geeresolve/login.dart';
import 'package:geeresolve/splash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://aqdcwwdcgvpdouybuzzz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxZGN3d2RjZ3ZwZG91eWJ1enp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI0NzEwMTAsImV4cCI6MjA2ODA0NzAxMH0.Lm9mRpYLZR7P1OJK1EnKXS2ReE4vnNdIStugGzeo9mU',
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/login': (context) => Login(),
        '/splash': (context) => Splash(),
        '/authority/register': (context) => AuthorityRegister(),
        '/authority/login': (context) => AuthorityLogin(),
        '/citizen/login': (context) => CitizenLogin(),
        '/citizen/dashboard': (context) => CitizenDashboard(),
        '/citizen/issue': (context) => CitizenProblem(),
        '/citizen/searchauthorities': (context) => SearchAuthorities(),
      },
    );
  }
}
