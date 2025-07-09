import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    void addData() async {
      final supabase = Supabase.instance.client;
      var username = usernameController.text.replaceAll(" ", "");
      var password = passwordController.text;
      bool passwordHasSpaces = password.contains(" ");
      try {
        if (passwordHasSpaces == true) {
          throw Exception("The password cannot have spaces");
        }
        final data = await supabase.from('users').insert({
          'username': username,
          'password': password,
        });
      } catch (error) {
        var message = error.toString();
        if (message.contains("duplicate key")) {
          message = "Username already exists";
        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Error: $message"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Close"),
                ),
              ],
            );
          },
        );
      }
    }

    void display() {
      var username = usernameController.text;
      username = username.replaceAll(" ", "");
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Username Entered"),
            content: Text("Your username is $username"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Close"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2282ce),
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/favicon.png', height: 66.0, width: 66.0),
            Text("GeoResolve", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
            maxLength: 45,
            decoration: InputDecoration(labelText: "Username"),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: passwordController,
            maxLength: 45,
            decoration: InputDecoration(labelText: "Password"),
          ),
          const SizedBox(height: 16.0),
          TextButton(
            onPressed: () {
              display();
              addData();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
