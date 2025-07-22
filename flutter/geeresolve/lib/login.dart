import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF180E83);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundImageSignIn.jpg'),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 500.0,
                  width: 500.0,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 50.0),
                      Container(
                        height: 50.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Center(
                          child: Text(
                            "SignIn",
                            style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 75.0),
                      Text(
                        "Are you a",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 250.0,
                        child: TextButton(
                          onPressed: () =>Navigator.pushNamed(context, '/citizen/login'),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            side: BorderSide(color: Colors.white, width: 2.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                size: 60.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 250.0,
                        child: TextButton(
                          onPressed: ()=>Navigator.pushNamed(context, '/authority/login'),
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            side: BorderSide(color: Colors.white, width: 2.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                size: 60.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
