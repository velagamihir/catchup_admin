import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final nameContoller = TextEditingController();
    final usernameController = TextEditingController();
    final mailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    String? role;
    String? district;
    List<String> roles = ['role1', 'role2', 'role3', 'role4'];
    List<String> districts = [
      'Krishna',
      'Guntur',
      'Prakasam',
      'East Godavari',
      'West Godavari',
    ];
    Color mainColor = Color(0xFF201a4a);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 100.0,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Signup",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Image.asset('assets/images/registerPageLogo.png',height: 150.0,),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: nameContoller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      counterText: "",
                    ),
                    maxLength: 50,
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Username",
                      counterText: "",
                    ),
                    maxLength: 50,
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButtonFormField(
                    value: role,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Role",
                    ),
                    items: roles.map((String role) {
                      return DropdownMenuItem(value: role, child: Text(role));
                    }).toList(),
                    onChanged: (String? selectedValue) {
                      role = selectedValue;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  DropdownButtonFormField(
                    value: district,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "District",
                    ),
                    items: districts.map((String district) {
                      return DropdownMenuItem(
                        value: district,
                        child: Text(district),
                      );
                    }).toList(),
                    onChanged: (String? districtSelected) {
                      district = districtSelected;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: mailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      counterText: "",
                    ),
                    maxLength: 100,
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      counterText: "",
                    ),
                    maxLength: 50,
                    obscuringCharacter: "*",
                    obscureText: true,
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password",
                      counterText: "",
                    ),
                    maxLength: 50,
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      side: BorderSide(width: 1.0, color: mainColor),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: Text("Signup", style: TextStyle(color: mainColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
