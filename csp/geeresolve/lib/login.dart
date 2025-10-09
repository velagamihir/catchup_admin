import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = firebase_auth.FirebaseAuth.instance;
  firebase_auth.User? _user;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _auth.authStateChanges().listen((firebase_auth.User? usr) {
      setState(() {
        _user = usr;
      });
    });
  }

  Future<firebase_auth.User?> googleSignIn() async {
    final curUser = _auth.currentUser;
    if (curUser != null) {
      return curUser;
    }
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser!.authentication;
    final credential = firebase_auth.GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final userCred = await _auth.signInWithCredential(credential);
    setState(() {
      _user = userCred.user;
    });
    return userCred.user;
  }

  @override
  Widget build(BuildContext context) {
    // Color primaryColor = Color(0xFFA4F4FF);
    Color secondaryColor = Color(0xFF211A4D);
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/loginPageTop.png',
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(500.0),
            ),
            child: Image.asset('assets/images/favicon.png', height: 500.0),
          ),
          const SizedBox(height: 10.0),
          const Text(
            "GeoResolve",
            style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                  width: 250.0,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: _busy
                        ? null
                        : () async {
                            setState(() {
                              _busy = true;
                            });
                            final user = await googleSignIn();
                            setState(() {
                              _busy = false;
                            });
                            if (mounted) {
                              if (user != null) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/home',
                                  (route) => false,
                                );
                              }
                            }
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.chrome_reader_mode, color: Colors.white, size: 32.0),
                        Text(
                          "Google Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/images/loginpageBottom.png',
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
