import 'package:flutter/material.dart';
import 'package:georesolve/home.dart';
import 'package:georesolve/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://fhrlyyjqxnwjjemmptym.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZocmx5eWpxeG53amplbW1wdHltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE5NjMyMzYsImV4cCI6MjA2NzUzOTIzNn0.GT2xRbKrbFECo656Rzi6vZU_OH7nDkgRhzAo5nS0B2Y',
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
      routes: {'/': (context) => Home(), '/login': (context) => Login()},
    );
  }
}
