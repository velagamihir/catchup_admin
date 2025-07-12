import 'package:flutter/material.dart';
import 'package:georesolve/authority_login.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/authority/login',
      routes: {'/authority/login': (context) => AuthorityLogin()},
    );
  }
}
