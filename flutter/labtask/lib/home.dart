import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0, color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/downArrow.png',height: 100.0, width: 100.0,),
            TextButton(onPressed: ()=>Navigator.pushNamed(context, '/login'), child: Text("Click here to navigate to the Login Page"))
          ],
        ),
      ),
    );
  }
}
