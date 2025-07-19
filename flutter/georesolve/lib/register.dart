import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Page"), centerTitle: true),
      body: Column(
        children: [
          TextButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/authority/register'),
            child: Text("Authority"),
          ),
        ],
      ),
    );
  }
}
