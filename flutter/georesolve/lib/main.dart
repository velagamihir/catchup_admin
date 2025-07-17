import 'package:flutter/material.dart';
import 'package:georesolve/authority_login.dart';
import 'package:georesolve/citizen_login.dart';
import 'package:georesolve/home.dart';
import 'package:georesolve/authority_register.dart';
import 'package:georesolve/login.dart';
import 'package:georesolve/register.dart';
import 'package:georesolve/role1.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://aqdcwwdcgvpdouybuzzz.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFxZGN3d2RjZ3ZwZG91eWJ1enp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI0NzEwMTAsImV4cCI6MjA2ODA0NzAxMH0.Lm9mRpYLZR7P1OJK1EnKXS2ReE4vnNdIStugGzeo9mU',
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>Home(),
        '/authority/login': (context) => AuthorityLogin(),
        '/login':(context)=>Login(),
        '/role1':(context)=>Role1(),
        '/register':(context)=>Register(),
        '/citizen/login':(context)=>CitizenLogin(),
      },
    );
  }
}
