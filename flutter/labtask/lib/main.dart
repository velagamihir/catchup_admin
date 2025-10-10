import 'package:flutter/material.dart';
import 'package:labtask/home.dart';
import 'package:labtask/login.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home':(context)=>Home(),
        '/login':(context)=>Login()
      },
    );
  }
}
