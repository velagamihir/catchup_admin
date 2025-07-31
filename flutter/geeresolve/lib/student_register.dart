import 'package:flutter/material.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({super.key});

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  List<String> genders = ['Male', 'Female'];
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset('assets/images/registerPage.png')),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 3.0
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 3.0
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Mail Id",
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black,
                            width: 3.0
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 3.0
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                    children: [
                      SizedBox(
                        width: 120.0,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3.0
                              )
                            ),
                              enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 3.0
                              )
                            ),
                            labelText: "Gender"
                          ),
                            value: gender,
                            items: genders.map((
                            String selectedGender) {
                          return DropdownMenuItem(value: selectedGender,
                              child: Text(selectedGender));
                        }).toList(), onChanged: (String? selectedGender) {
                          gender = selectedGender;
                        }),
                      ),
                      SizedBox(
                        width: 150.0,
                        child: TextField(
                          decoration: InputDecoration(
                            
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
