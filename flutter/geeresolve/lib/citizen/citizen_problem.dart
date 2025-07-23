import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CitizenProblem extends StatefulWidget {
  const CitizenProblem({super.key});

  @override
  State<CitizenProblem> createState() => _CitizenProblemState();
}

class _CitizenProblemState extends State<CitizenProblem> {
  File? _imageFile;
  final _picker = ImagePicker();
  final supabase=Supabase.instance.client;

  Future<void> _pickfromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
        supabase.storage.from('problems.pics').upload(pickedFile.path, _imageFile!);
      }
    } catch (error) {
      var message = error.toString();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  final _auth = firebase_auth.FirebaseAuth.instance;
  Color mainColor = Color(0xFF180E83);
  firebase_auth.User? _user;
  String? displayPicture;
  final districtController = TextEditingController();
  final mandalController = TextEditingController();
  final villageController = TextEditingController();
  final concernController = TextEditingController();

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
      bottomNavigationBar: BottomAppBar(
        color: mainColor,
        height: 90.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(
                    context,
                    '/citizen/searchauthorities',
                  ),
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
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/citizen/dashboard'),
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
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, '/citizen/issue'),
              child: Column(
                children: [
                  Image.asset('assets/images/complaint.png', height: 30.0),
                  Text(
                    "Issue Complaint",
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            Center(
              child: Text(
                "Issue Complaint",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28.0),
              ),
            ),
            TextButton(onPressed: () async {
              _pickfromCamera();
            }, child: Text("Pick from camera"))
          ],
        ),
      ),
    );
  }
}
