import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CitizenProblem extends StatefulWidget {
  const CitizenProblem({super.key});

  @override
  State<CitizenProblem> createState() => _CitizenProblemState();
}

class _CitizenProblemState extends State<CitizenProblem> {
  String? _locationMessage;
  String? _fileName;
  final _auth = firebase_auth.FirebaseAuth.instance;
  firebase_auth.User? _user;
  File? _imageFile;
  final db = FirebaseFirestore.instance;
  final _picker = ImagePicker();
  final supabase = Supabase.instance.client;
  Position? _position;

  Future<void> _pickfromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    try {
      var district = districtController.text.trim();
      var mandal = mandalController.text.trim();
      var village = villageController.text.trim();
      if (district.isEmpty || mandal.isEmpty || village.isEmpty) {
        throw Exception("Enter all the fields");
      }
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
        _user = _auth.currentUser;
        final timestamp = DateTime.now();
        final timeString = timestamp.toString().replaceAll(" ", "_");
        final displayName = _user?.displayName?.replaceAll(' ', '_');
        _fileName = 'citizen_issues/${displayName}_$timeString.jpg';
        await supabase.storage.from('problems').upload(_fileName!, _imageFile!);
      }
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          _locationMessage = "Location services are disabled.";
        });
        return;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            _locationMessage = "Location permission denied.";
          });
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        setState(() {
          _locationMessage =
              "Location permission permanently denied. Enable it from settings.";
        });
        return;
      }
      _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final data = <String, String>{
        "district": district,
        "mandal": mandal,
        "userDisplayName": _user!.displayName!,
        "userLatitude": _position!.latitude.toString(),
        "userLongitude": _position!.longitude.toString(),
        "village": village,
      };
      await db.collection("problems").doc(_fileName!).set(data);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Complaint Registered")));
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

  Color mainColor = Color(0xFF180E83);
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
              onPressed: () => Navigator.pushReplacementNamed(
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
            const SizedBox(height: 50.0),
            Center(
              child: Text(
                "Issue Complaint",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24.0),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  TextField(
                    controller: districtController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "District",
                      counterText: "",
                    ),
                    maxLength: 50,
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: mandalController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Mandal",
                      counterText: "",
                    ),
                    maxLength: 50,
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: villageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Village",
                      counterText: "",
                    ),
                    maxLength: 50,
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 250.0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFD9D9D9),
                        side: BorderSide(width: 1.0, color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () => _pickfromCamera(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 28.0,
                          ),
                          Text(
                            "Upload Photo",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
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
