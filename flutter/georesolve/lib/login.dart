import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF201a4a);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundImageSignIn.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: mainColor,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    height: 45.0,
                    width: 100.0,
                    child: Center(
                      child: Text(
                        "SignIn",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Are you a",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 200.0,
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/authority/login',
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8.0),
                        ),
                        side: BorderSide(width: 1.0, color: Colors.white),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Authority",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 32.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 200.0,
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/citizen/login',
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(8.0),
                        ),
                        side: BorderSide(width: 1.0, color: Colors.white),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Citizen",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 32.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
