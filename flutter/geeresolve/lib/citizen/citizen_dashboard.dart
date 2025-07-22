import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';

class CitizenDashboard extends StatefulWidget {
  const CitizenDashboard({super.key});

  @override
  State<CitizenDashboard> createState() => _CitizenDashboardState();
}

class _CitizenDashboardState extends State<CitizenDashboard> {
  final _auth = firebase_auth.FirebaseAuth.instance;
  firebase_auth.User? _user;
  String? photo;
  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _auth.authStateChanges().listen((firebase_auth.User? usr) {
      _user = usr;
      debugPrint('user=$_user');
    });
    this.photo = _user?.photoURL;
  }

  Future<void> _signOut() async {
    final user = _auth.currentUser;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          user == null
              ? 'No user logged in.'
              : '"${user.displayName}" logged out.',
        ),
      ),
    );
    _auth.signOut();
    setState(() =>_user = null);
  }

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF180E83);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: mainColor,
        title: Row(
          children: [
            Image.asset('assets/images/favicon.png', height: 110),
            Text(
              "GeoResolve",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 45.0,
                    backgroundImage: NetworkImage(photo!),
                  ),
                  Text("${_user!.displayName}", style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
            ListTile(
              title: Text("Profile"),
              onTap: () {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${_user!.displayName}")),
                  );
                }
              },
            ),
            ListTile(
              title: Text("Search Authorities"),
              onTap: ()=>Navigator.pushNamed(context, '/citizen/searchauthorities'),
            ),
            ListTile(
              title: Text("Issue Complaint"),
              onTap: ()=>Navigator.pushNamed(context, '/citizen/issue'),
            ),
            ListTile(
              title: Text("Updates"),
              onTap: (){},
            ),
            ListTile(
              title: Text("About Us"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Policy"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Logout"),
              onTap: (){
                _signOut();
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route)=>false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
