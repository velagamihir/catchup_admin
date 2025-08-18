import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQs")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/faq.png'),
            const SizedBox(height: 20.0),
            ExpansionTile(
              title: Text(
                "What is GeoResolve?",
                style: TextStyle(color: Colors.black, fontSize: 24.0),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text('''
A1: GeoResolve is a mobile application designed to simplify the process of *reporting and tracking various concerns within your college community*. It acts as a direct communication channel between students and college authorities, helping to address issues like general grievances, behavioral concerns, academic matters, or campus infrastructure problems efficiently.
                '''),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ExpansionTile(
              title: Text("Who can use GeoResolve?"),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text('''
A2: GeoResolve is intended for *currently enrolled students of VVITU*. You'll need to register an account to use the service.
'''),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ExpansionTile(title: Text("Is GeoResolve an emergency service?"),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text('''
A3: *No, GeoResolve is not for emergencies.* For immediate threats, safety concerns, or medical emergencies, please contact college security, relevant emergency services, or the appropriate college department directly (e.g., student counseling services for urgent mental health crises).

              '''),
              )
            ],),
          ],
        ),
      ),
    );
  }
}
