import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';

class CitizenProblem extends StatefulWidget {
  const CitizenProblem({super.key});

  @override
  State<CitizenProblem> createState() => _CitizenProblemState();
}

class _CitizenProblemState extends State<CitizenProblem> {
  final _auth = firebase_auth.FirebaseAuth.instance;
  Color mainColor = Color(0xFF180E83);
  firebase_auth.User? _user;
  String? displayPicture;
  String? firstName;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    displayPicture = _user!.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("GeoResolve", style: TextStyle(fontSize: 32.0)),
            TextButton(
              child: CircleAvatar(
                backgroundImage: NetworkImage(displayPicture!),
              ),
              onPressed: () {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${_user!.displayName}")),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: Image.asset('assets/images/complaint.png'),
      bottomNavigationBar: BottomAppBar(
        color: mainColor,
        height: 90.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/search_authorities.png',
                    height: 30.0,
                  ),
                  Text(
                    "Search Authorities",
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Column(
                children: [
                  Image.asset('assets/images/Vector.png', height: 30.0),
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
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
