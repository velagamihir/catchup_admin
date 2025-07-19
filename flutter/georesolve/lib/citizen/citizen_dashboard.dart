import 'package:flutter/material.dart';

class CitizenDashboard extends StatelessWidget {
  const CitizenDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF201A4A);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: mainColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/favicon.png', width: 100),
            Text(
              "GeoResolve",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  const SizedBox(width: 20.0),
                  CircleAvatar(
                    radius: 40.0,
                    child: Icon(Icons.person, size: 40.0),
                  ),
                  const SizedBox(width: 20),
                  Text("Username", style: TextStyle(fontSize: 32.0)),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "Search Authorities",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "Issue complaint",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "Updates",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "About Us",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "Policy",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
            ),
            ListTile(
              onTap: () =>Navigator.pushNamedAndRemoveUntil(context, '/login', (route)=>false),
              title: Text(
                "Logout",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
