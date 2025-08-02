import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFA4F4FF);
    Color secondaryColor = Color(0xFF211A4D);
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
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  child: Icon(Icons.person, size: 30.0),
                ),
                Text("Username", style: TextStyle(fontSize: 32.0)),
              ],
            ),
            const SizedBox(height: 20.0),
            ListTile(title: Text("Profile", style: TextStyle(fontSize: 20.0))),
            const SizedBox(height: 20.0),
            ListTile(title: Text("About Us", style: TextStyle(fontSize: 20.0))),
            const SizedBox(height: 20.0),
            ListTile(
              title: Text("User Policy", style: TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20.0),
            ListTile(title: Text("Support", style: TextStyle(fontSize: 20.0))),
            const SizedBox(height: 20.0),
            ListTile(
              title: Text("Suggestions", style: TextStyle(fontSize: 20.0)),
            ),
            const SizedBox(height: 20.0),
            ListTile(title: Text("FAQs", style: TextStyle(fontSize: 20.0))),
            const SizedBox(height: 20.0),
            ListTile(
              title: Text("Logout", style: TextStyle(fontSize: 20.0)),
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                '/splash',
                (route) => false,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                  onPressed: () {},
                  child: Column(
                    children: [
                      Icon(Icons.error, color: Colors.black),
                      Text("Complaint", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: ()=>Navigator.pushReplacementNamed(context, '/home'),
                  child: Column(
                    children: [
                      Icon(Icons.home_outlined, color: Colors.black),
                      Text("Home", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: (){},
                  child: Column(
                    children: [
                      Icon(Icons.circle, color: Colors.black),
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
