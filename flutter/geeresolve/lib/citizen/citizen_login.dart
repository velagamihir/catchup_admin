import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
class CitizenLogin extends StatefulWidget {
  const CitizenLogin({super.key});

  @override
  State<CitizenLogin> createState() => _CitizenLoginState();
}

class _CitizenLoginState extends State<CitizenLogin> {
  final _auth = firebase_auth.FirebaseAuth.instance;
  firebase_auth.User? _user;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    this._user = _auth.currentUser;
    _auth.authStateChanges().listen((firebase_auth.User? usr) {
      this._user = usr;
      debugPrint('user=$_user');
    });
  }

  Future<firebase_auth.User?> _googleSignIn() async {
    final curUser = this._user ?? _auth.currentUser;
    if (curUser != null && !curUser.isAnonymous) {
      return curUser;
    }
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser!.authentication;
    final credential = firebase_auth.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final user = (await _auth.signInWithCredential(credential)).user;
    setState(() => _user = user);
    return user;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              onPressed: this._busy
                  ? null
                  : () async {
                setState(() => this._busy = true);
                final user = await this._googleSignIn();
                setState(() => this._busy = false);
                if(mounted){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("User: ${user!.displayName}")));
                }
                if(user!=null){
                  Navigator.pushNamedAndRemoveUntil(context, '/citizen/dashboard', (route)=>false);
                }
              },
              child: Text("Google Signup"),
            ),
          ],
        )
      ),
    );
  }
}
