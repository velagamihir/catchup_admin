import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(color: Colors.black, fontSize: 32.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "GeoResolve",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
            ),
            Text(
              "YOUR CAMPUS. YOUR VOICE. RESOLVED.",
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              "Welcome to GeoResolve, the platform designed to foster a supportive and responsive environment within your college community. At GeoResolve, we believe that every student deserves a voice and a clear path to address concerns that impact their academic life and well-being",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 10.0),
            Text(
              "Life in college can be dynamic, and sometimes, situations arise that require a formal resolution process. GeoResolve is built to bridge the communication gap between students and college authorities, providing a secure and efficient way to report and track issues that matter to you.",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 20.0),
            Text(
              "Our Mission",
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Our mission is to empower students by providing a transparent and accessible channel for addressing various campus concerns. By enabling easy reporting and tracking of issues, we aim to promote a proactive approach to problem-solving, ensuring a fair, respectful, and conducive learning environment for everyone.",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
