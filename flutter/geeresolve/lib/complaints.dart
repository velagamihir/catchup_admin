import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Complaints extends StatefulWidget {
  const Complaints({super.key});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  Color secondaryColor = Color(0xFF211A4D);
  final issueController = TextEditingController();
  final roomNoController = TextEditingController();
  final _auth = firebase_auth.FirebaseAuth.instance;
  final _user = firebase_auth.FirebaseAuth.instance.currentUser;
  XFile? _imageFile;
  String? filePath;
  final _picker = ImagePicker();
  bool _photoUploaded = false;
  List<String> issueTypes = [
    'Food',
    'Transport',
    'Sanitation',
  ]; //the types of issue
  List<String> blocks = ['A', 'B', 'C', 'D', 'Siemens', 'Admin'];
  String? issueType; //the issue that is selected
  String? block; //the block that is selected
  final supabase = Supabase.instance.client;

  // method to file the complaint and add the picture to the storage bucket
  void uploadImage() async {
    try {
      if(_photoUploaded==false){
        final pickedImage = await _picker.pickImage(source: ImageSource.camera);
        filePath = "citizen_issues/${_user!.displayName} ${DateTime.now()}";
        setState(() {
          _imageFile = pickedImage;
        });
        final File file = File(pickedImage!.path);
        await supabase.storage.from('problems').upload(filePath!, file);
        setState(() {
          _photoUploaded = true;
        });
        debugPrint("Photo Upload successful");
      }
      else{
        throw Exception("Photo already uploaded");
      }
    } catch (error) {
      var message = error.toString();
      debugPrint(error.toString());
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  void submitProblem() async {
    try {
      var issue = issueController.text.trim();
      var roomNo = roomNoController.text.trim();
      if (issue.isEmpty ||
          roomNo.isEmpty ||
          issueType == null ||
          block == null) {
        throw Exception("Enter all the fields");
      }
      if (_photoUploaded == false) {
        throw Exception("Upload the photo first");
      }
      await supabase.from("problems").insert({
        "photoid": filePath,
        "username": _user!.displayName,
        "issue": issue,
        "roomno": roomNo,
        "block": block,
        "issuetype": issueType,
      });
      debugPrint("Submission successfully");
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: const Text("Submission Successful")));
      }
    } catch (error) {
      var message = error.toString();
      debugPrint(message);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complaints", style: TextStyle(fontSize: 32.0)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: 300.0,
                width: 200.0,
                child: Image.asset(
                  'assets/images/complaintsPage.png',
                  height: 300.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3.0, color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3.0, color: Colors.black),
                      ),
                      labelText: "Type of Issue",
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    value: issueType,
                    items: issueTypes.map((String? selectedIssueType) {
                      return DropdownMenuItem(
                        value: selectedIssueType,
                        child: Text("$selectedIssueType"),
                      );
                    }).toList(),
                    onChanged: (String? selectedIssueType) {
                      issueType = selectedIssueType;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: issueController,
                    decoration: InputDecoration(
                      label: Text(
                        "Issue",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3.0, color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3.0, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 150.0,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            label: Text(
                              "Block",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3.0,
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          items: blocks.map((String? selectedBlock) {
                            return DropdownMenuItem(
                              value: selectedBlock,
                              child: Text("$selectedBlock"),
                            );
                          }).toList(),
                          onChanged: (String? selectedBlock) {
                            block = selectedBlock;
                          },
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: TextField(
                          controller: roomNoController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3.0,
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3.0,
                                color: Colors.black,
                              ),
                            ),
                            label: Text(
                              "Room no.",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 3.0, color: Colors.black),
                        ),
                      ),
                      onPressed: () => uploadImage(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 60.0,
                          ),
                          Text(
                            "Photo/Video",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  SizedBox(
                    height: 50.0,
                    width: 100.0,
                    child: TextButton(
                      onPressed: () => submitProblem(),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                        backgroundColor: secondaryColor,
                      ),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
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
