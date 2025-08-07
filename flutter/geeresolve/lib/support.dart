import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Support", style: TextStyle(fontSize: 32.0))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Center(child: Image.asset('assets/images/support.png')),
            Row
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.call),
                const SizedBox(width: 20.0),
                Text("+91 12345 67890", style: TextStyle(fontSize: 24)),
              ],
            ),
            const SizedBox(height: 20.0,),
            Row
              (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.mail),
                const SizedBox(width: 20.0),
                Text("georesolve.mail@gmail.com", style: TextStyle(fontSize: 20)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
