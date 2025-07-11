import 'package:flutter/material.dart';

class AuthorityLogin extends StatelessWidget {
  const AuthorityLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Welcome to GeoResolve!!!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0,),
            ),
          ],
        ),
      ),
    );
  }
}
