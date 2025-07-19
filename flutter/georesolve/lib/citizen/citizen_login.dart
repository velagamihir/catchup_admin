import 'package:flutter/material.dart';

class CitizenLogin extends StatelessWidget {
  const CitizenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF201a4a);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 75.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 75.0,
                width: 150.0,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Citizen",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Text(
            "Continue with Google",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27.0),
          ),
          const SizedBox(height: 50.0),
          SizedBox(
            width: 300.0,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8.0),
                ),
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/citizen/dashboard',
                (route) => false,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/googleNoBGImage.png', width: 38),
                  Text(
                    "Login with Google",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 1.0, width: 125.0, color: Colors.black),
                Text(
                  "or",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
                Container(height: 1.0, width: 125.0, color: Colors.black),
              ],
            ),
          ),
          const SizedBox(height: 50.0),
          Text(
            "First Time User?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          const SizedBox(height: 50.0),
          SizedBox(
            width: 300.0,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8.0),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/googleNoBGImage.png', width: 38),
                  Text(
                    "Signup with Google",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
