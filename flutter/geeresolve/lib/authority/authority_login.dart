import 'package:flutter/material.dart';

class AuthorityLogin extends StatefulWidget {
  const AuthorityLogin({super.key});

  @override
  State<AuthorityLogin> createState() => _AuthorityLoginState();
}

class _AuthorityLoginState extends State<AuthorityLogin> {
  List<String> roles = ['role1', 'role2', 'role3', 'role4'];
  String? role;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _showPassword = false;
  Color mainColor = Color(0xFF180E83);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to GeoResolve!!",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 26.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              Image.asset(
                'assets/images/logoAuthorityLogin.png',
                height: 150.0,
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 150),
                      child: DropdownButtonFormField(
                        value: role,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Role",
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
                    ),
                    const SizedBox(height: 30.0),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        counterText: "",
                      ),
                      maxLength: 45,
                    ),
                    const SizedBox(height: 30.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: _showPassword ? Colors.blue : Colors.grey,
                          ),
                        ),
                      ),
                      obscureText: !_showPassword,
                      obscuringCharacter: '*',
                    ),
                    const SizedBox(height: 45.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do not have an account?",style: TextStyle(fontWeight: FontWeight.w500),),
                        TextButton(

                          onPressed: () => Navigator.pushReplacementNamed(
                            context,
                            '/authority/register',
                          ),
                          child: Text(
                            "Signup",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
