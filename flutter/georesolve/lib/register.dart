import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}
    final supabase=Supabase.instance.client;
    final nameController = TextEditingController();
    final usernameController = TextEditingController();
    final mailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    String? role;
    String? district;
    List<String> roles = ['role 1', 'role 2', 'role 3', 'role 4', 'role 5'];
    List<String> districts = [
      'Krishna',
      'Prakasam',
      'West Godavari',
      'East Godavari',
    ];
    Color mainColor = Color(0xFF201a4a);
    Color backgroundColor = Color(0xFFfef7ff);
    void addUser()async{
      var  name=nameController.text;
      var username=usernameController.text;
      var mail=mailController.text;
      var password=passwordController.text;
      var confirmPassword=confirmPasswordController.text;
      try{
        await supabase.auth.signInWithPassword(password: password,email:mail);
      }
      catch(error){
        var message=error.toString();
        if(message.contains("Invalid login credentials")){
          supabase.auth.signUp(password: password,email:mail);
        }
      }
    }

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,

            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Transform.translate(
                  offset: Offset(0, -10),
                  child: Container(
                    height: 75.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: backgroundColor,
                    ),
                    child: Center(
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Name",
                          counterText: "",
                          filled: true,
                          fillColor: backgroundColor,
                        ),
                        maxLength: 50,
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Username",
                          counterText: "",
                          filled: true,
                          fillColor: backgroundColor,
                        ),
                        maxLength: 50,
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
                        items: roles.map((String roleItem) {
                          return DropdownMenuItem(
                            value: roleItem,
                            child: Text(roleItem),
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
                          labelText: "Districts",
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        items: districts.map((String districtItem) {
                          return DropdownMenuItem(
                            value: districtItem,
                            child: Text(districtItem),
                          );
                        }).toList(),
                        onChanged: (String? selectedDistrict) {
                          district = selectedDistrict;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: mailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Mail",
                          counterText: "",
                          filled: true,
                          fillColor: backgroundColor,
                        ),
                        maxLength: 50,
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Password",
                          counterText: "",
                          filled: true,
                          fillColor: backgroundColor,
                        ),
                        obscuringCharacter: "*",
                        obscureText: true,
                        maxLength: 50,
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Confirm Password",
                          counterText: "",
                          filled: true,
                          fillColor: backgroundColor,
                        ),
                        obscuringCharacter: "*",
                        obscureText: true,
                        maxLength: 50,
                      ),
                      const SizedBox(height: 50),
                      TextButton(
                        onPressed: () =>addUser(),
                        style: TextButton.styleFrom(
                          backgroundColor: backgroundColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          "Signup",
                          style: TextStyle(color: mainColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
