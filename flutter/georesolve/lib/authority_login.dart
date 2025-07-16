import 'package:flutter/material.dart';
import 'package:georesolve/register.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthorityLogin extends StatefulWidget {
  const AuthorityLogin({super.key});

  @override
  State<AuthorityLogin> createState() => _AuthorityLoginState();
}

class _AuthorityLoginState extends State<AuthorityLogin> {
  final supabase = Supabase.instance.client;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  List<String> roles = ['role1', 'role2', 'role3', 'role4'];
  String? role;

  void signinUser() async {
    var password = passwordController.text;
    var email = mailController.text;
    try {
      if (!email.contains('@')) {
        throw Exception("Enter valid email");
      }
      if (password.contains(" ") || email.contains(" ")) {
        throw Exception("Fields cannot contain spaces");
      }
      await supabase.auth.signInWithPassword(password: password, email: email);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User login successful")));
    } catch (error) {
      var message = error.toString();
      if (message.contains("invalid login credentials")) {
        message = "Wrong password or username";
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar( SnackBar(content: Text("Error: $message")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Text(
                    "Welcome to GeoResolve!!!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Image.asset(
                'assets/images/logoAuthorityLogin.png',
                height: 200.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: DropdownButtonFormField(
                      value: role,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Role",
                      ),
                      items: roles.map((String role) {
                        return DropdownMenuItem(value: role, child: Text(role));
                      }).toList(),
                      onChanged: (String? newSelected) {
                        role = newSelected;
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      counterText: "",
                    ),
                    maxLength: 50,
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                    ),
                    obscureText: true,
                    obscuringCharacter: "*",
                  ),
                  const SizedBox(height: 20.0),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF511659),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                    child: Text("Login", style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontWeight: FontWeight.normal),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/register'),
                        child: Text(
                          "Signup",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
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
    );
  }
}
