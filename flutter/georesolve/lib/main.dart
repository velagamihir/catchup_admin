import 'package:flutter/material.dart';
import 'package:georesolve/authority_login.dart';
import 'package:georesolve/home.dart';
import 'package:georesolve/register.dart';

void main() {
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
        '/register': (context) => Register(),
      },
    );
  }
}
