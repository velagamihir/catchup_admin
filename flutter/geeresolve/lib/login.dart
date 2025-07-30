import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFA4F4FF);
    Color secondaryColor = Color(0xFF211A4D);
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/loginPageTop.png', width: 1000.0),
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(500.0),
            ),
            child: Image.asset('assets/images/favicon.png', height: 500.0),
          ),
          const SizedBox(height: 10.0),
          const Text(
            "GeoResolve",
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30.0),
          SizedBox(
            height: 50.0,
            width: 150.0,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          SizedBox(
            height: 50.0,
            width: 150.0,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: ()=>Navigator.pushNamed(context, '/register'),
              child: Text(
                "Register",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 119.1),
          Image.asset('assets/images/loginpageBottom.png'),
        ],
      ),
    );
  }
}
