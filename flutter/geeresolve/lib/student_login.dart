import 'package:flutter/material.dart';

class StudentLogin extends StatelessWidget {
  const StudentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFA4F4FF);
    Color secondaryColor = Color(0xFF211A4D);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Image.asset('assets/images/loginPage.png'),
                const SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: 100.0,
                  child: TextButton(
                    onPressed: ()=>Navigator.pushNamedAndRemoveUntil(context, '/introduction', (route)=>false),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
