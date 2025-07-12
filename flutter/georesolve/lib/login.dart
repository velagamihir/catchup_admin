import 'package:flutter/material.dart';

class AuthorityLogin extends StatelessWidget {
  const AuthorityLogin({super.key});

  @override
  Widget build(BuildContext context) {
    String? role;
    List<String> roles = ['role1', 'role2', 'role3'];
    final roleController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                "Welcome to GeoResolve!!!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/logoAuthorityLogin.png',
                  height: 150.0,
                ),
              ],
            ),
            const SizedBox(height: 0.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 150.0),
                    child: DropdownButtonFormField(decoration: InputDecoration(border: OutlineInputBorder(),
                    labelText: "Role"),
                        items: roles.map((String role){
                      return DropdownMenuItem(value: role,
                          child: Text(role));
                    }).toList(), onChanged: (String? newValue){
                      role=newValue;
                    }),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: emailController,
                    maxLength: 50,
                    decoration: InputDecoration(
                      labelText: "Email",
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: passwordController,
                    maxLength: 50,
                    obscuringCharacter: "*",
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      counterText: "",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF571760),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              child: Text("Login", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
