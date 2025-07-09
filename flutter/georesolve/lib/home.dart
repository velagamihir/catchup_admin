import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/favicon.png', height: 60.0, width: 60.0),
            Text("GeoResolve"),
          ],
        ),
        backgroundColor: Color(0xFF2282ce),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              icon: Icon(Icons.login,),
              color: Color(0xFF2282ce),
            ),
          ],
        ),
      ),
    );
  }
}
