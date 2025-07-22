import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthorityRegister extends StatefulWidget {
  const AuthorityRegister({super.key});

  @override
  State<AuthorityRegister> createState() => _AuthorityLoginState();
}

class _AuthorityLoginState extends State<AuthorityRegister> {
  final db = FirebaseFirestore.instance;
  Color mainColor = Color(0xFF180E83);
  Color backgroundColor = Color(0xFFfef7ff);
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  String? role;
  String? district;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _passwordShow = true;
  bool _confirmPasswordShow = true;
  final List<String> roles = ['role1', 'role2', 'role3'];
  final List<String> districts = [
    'Krishna',
    'West Godavari',
    'East Godavari',
    'Prakasam',
  ];
  void signUpAuthority() async{
    var name = nameController.text.trim();
    var username = usernameController.text.trim();
    var email = emailController.text.trim();
    var password = passwordController.text.trim();
    var confirmPassword = confirmPasswordController.text.trim();
    final user=await db.collection("AuthorityApproval").doc(email).get();
    final userExists=user.exists;
    final authority=await db.collection("Authorities").doc(username).get();
    final authorityExists=authority.exists;
    try {
      if(userExists || authorityExists){
        throw Exception("User already exists");
      }
      if (password != confirmPassword) {
        throw Exception("Passwords do not match");
      }
      if (name.isEmpty ||
          username.isEmpty ||
          email.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty ||
          role == null ||
          district == null) {
        throw Exception("Enter all the fields");
      }
      if (!email.contains('@')) {
        throw Exception("Enter valid email");
      }
      final authority = <String, String>{
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "district": district!,
        "role": role!,
      };
      await db.collection("AuthorityApproval").doc(username).set(authority);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration Successful")),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "You will be able to login after 24 hours if the Admin accepts your request",
            ),
          ),
        );
      }
    } catch (error) {
      var message = error.toString().replaceAll("Exception:", "");
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $message")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(16)),
              width: 500.0,
              child: Column(
                children: [
                  Transform.translate(
                    offset: Offset(0, -20),
                    child: Container(
                      height: 75.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Center(
                        child: Text(
                          "Signup",
                          style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 36.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: backgroundColor,
                            filled: true,
                            labelText: "Name",
                            counterText: "",
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: backgroundColor,
                            filled: true,
                            labelText: "Username",
                            counterText: "",
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        DropdownButtonFormField(
                          value: role,
                          decoration: InputDecoration(
                            fillColor: backgroundColor,
                            filled: true,
                            labelText: "Role",
                            counterText: "",
                            border: InputBorder.none,
                          ),
                          items: roles.map((String selectedRole) {
                            return DropdownMenuItem(
                              value: selectedRole,
                              child: Text(selectedRole),
                            );
                          }).toList(),
                          onChanged: (String? selectedRole) {
                            role = selectedRole;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        DropdownButtonFormField(
                          value: district,
                          decoration: InputDecoration(
                            fillColor: backgroundColor,
                            filled: true,
                            labelText: "District",
                            counterText: "",
                            border: InputBorder.none,
                          ),
                          items: districts.map((String selectedDistrict) {
                            return DropdownMenuItem(
                              value: selectedDistrict,
                              child: Text(selectedDistrict),
                            );
                          }).toList(),
                          onChanged: (String? selectedDistrict) {
                            district = selectedDistrict;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: backgroundColor,
                            filled: true,
                            labelText: "Mail",
                            counterText: "",
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: backgroundColor,
                            filled: true,
                            labelText: "Password",
                            counterText: "",
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: _passwordShow
                                    ? Colors.grey
                                    : Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordShow = !_passwordShow;
                                });
                              },
                            ),
                          ),
                          obscuringCharacter: '*',
                          obscureText: _passwordShow,
                        ),
                        const SizedBox(height: 20.0),
                        TextField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: backgroundColor,
                            filled: true,
                            labelText: "Confirm Password",
                            counterText: "",
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: _confirmPasswordShow
                                    ? Colors.grey
                                    : Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  _confirmPasswordShow = !_confirmPasswordShow;
                                });
                              },
                            ),
                          ),
                          obscuringCharacter: '*',
                          obscureText: _confirmPasswordShow,
                        ),
                        const SizedBox(height: 50.0),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () => signUpAuthority(),
                          child: Text(
                            "Signup",
                            style: TextStyle(color: mainColor),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
