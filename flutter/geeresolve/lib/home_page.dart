import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = firebase_auth.FirebaseAuth.instance;
  firebase_auth.User? _user;
  String? photoLink;
  String? username;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    if (_user != null) {
      photoLink = _user!.photoURL;
      username = _user!.displayName;
    } else {
      photoLink = null;
      username = null;
    }
  }

  void signOut() async {
    await _auth.signOut();
    setState(() {
      _user = null;
    });
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFA4F4FF);
    // Color secondaryColor = Color(0xFF211A4D);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: Row(
          children: [
            Image.asset('assets/images/favicon.png', height: 100.0),
            Text(
              "GeoResolve",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            IconButton(onPressed: (){}, icon: Badge.count(count: 3))
          ],
        ),
      ),
      endDrawer: Drawer(
        width: 250.0,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: photoLink != null
                      ? NetworkImage(photoLink!)
                      : AssetImage('assets/images/defaultAvatar.png'),
                  radius: 30.0,
                ),
                Text(
                  username != null ? username! : "Username",
                  style: TextStyle(fontSize: 24.0),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            ListTile(title: Text("Profile", style: TextStyle(fontSize: 20.0))),
            const SizedBox(height: 5.0),
            ListTile(
              onTap: (() => Navigator.pushNamed(context, '/about')),
              title: Text("About Us", style: TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 5.0),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/complaint'),
              title: Text("Issue Complaints", style: TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 5.0),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/support'),
              title: Text("Support", style: TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 5.0),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/status'),
              title: Text("Status", style: TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 5.0),
            ListTile(
              onTap: () => Navigator.pushNamed(context, '/faq'),
              title: Text("FAQs", style: TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 5.0),
            ListTile(
              title: Text("Logout", style: TextStyle(fontSize: 20.0)),
              onTap: () => signOut(),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: primaryColor),
              child: Image.asset('assets/images/homePage.png'),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const SizedBox(width: 30.0),
                Text(
                  "Announcements",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: 250.0,
                    width: 250.0,
                    child: Card(child: Text("Card 1")),
                  ),
                  const SizedBox(width: 50.0),
                  SizedBox(
                    height: 250.0,
                    width: 250.0,
                    child: Card(child: Text("Card 2")),
                  ),
                  const SizedBox(width: 50.0),
                  SizedBox(
                    height: 250.0,
                    width: 250.0,
                    child: Card(child: Text("Card 3")),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60.0),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60.0),
          child: BottomAppBar(
            color: primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/complaint'),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/complaint.png',
                        color: Colors.black,
                        height: 15.0,
                      ),
                      Text("Complaint", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/home'),
                  child: Column(
                    children: [
                      Icon(Icons.home_outlined, color: Colors.black),
                      Text("Home", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/status'),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/status.png',
                        color: Colors.black,
                        height: 15.0,
                      ),
                      Text("Status", style: TextStyle(color: Colors.black)),
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
