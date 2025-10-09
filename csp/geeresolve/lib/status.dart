import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  List<String> problems = [];
  String? problemId;
  final issueController = TextEditingController();
  bool _problemFound = false;
  final _auth = firebase_auth.FirebaseAuth.instance;
  firebase_auth.User? _user;
  String? _displayName;
  String? _email;
  String? _problemPictureUrl;
  String? _phNo;
  final supabase = Supabase.instance.client;
  Color secondaryColor = Color(0xFF211A4D);

  @override
  void initState() {
    super.initState();
    setState(() {
      _user = _auth.currentUser;
      _displayName = _user!.displayName;
      _email = _user!.email;
      _phNo = _user!.phoneNumber;
    });
    loadUserProblems();
  }
  void loadNotifications()async{
    try{
      final data=supabase.from("notifications").select().eq("displayname", _displayName!);
      debugPrint(data.toString());
    }
    catch(error){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }
  void loadUserProblems() async {
    try {
      final data = await supabase
          .from("problems")
          .select()
          .eq('username', _displayName!);
      if (data.isEmpty) {
        throw Exception('You have no problems to mark');
      }
      setState(() {
        problems = data.map((user) => user['photoid'].toString()).toList();
      });
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString())));
      }
    }
  }

  void searchPicture() async {
    try {
      final data = await supabase
          .from("problems")
          .select('''
      username,photoid
      ''')
          .eq("photoid", problemId!);
      if (data.isEmpty) {
        throw Exception("No issue found");
      }
      setState(() {
        _problemFound = true;
      });
      final firstData = data[0];
      if (firstData['username'] != _displayName) {
        throw Exception("You did not file this complaint");
      }
      setState(() {
        _problemPictureUrl = supabase.storage
            .from('problems.bucket')
            .getPublicUrl(firstData['photoid']);
      });
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

  void markComplete() async {
    try {
      if (!_problemFound) {
        throw Exception(
          "Please click the search icon\nIf you already have, then there is no such problem",
        );
      }
      await supabase.from("problems").delete().eq("photoid", problemId!);
      await supabase.storage.from('problems.bucket').remove([problemId!]);
      debugPrint("Problem Successfully marked");
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: const Text("Marked as complete")));
      }
      reloadProblems();
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

  void reloadProblems() async {
    final data = await supabase
        .from('problems')
        .select()
        .eq('photoid', problemId!);
    setState(() {
      problems = data.map((user) => user['photoid'].toString()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFFA4F4FF);
    return Scaffold(
      appBar: AppBar(title: Text("Status", style: TextStyle(fontSize: 32.0))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Center(child: Image.asset('assets/images/statusPage.png')),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        label: Text(
                          "Problem ID",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      value: problemId,
                      items: problems.map((String? selectedProblem) {
                        return DropdownMenuItem(
                          value: selectedProblem,
                          child: Text(selectedProblem!),
                        );
                      }).toList(),
                      onChanged: (String? selectedProblem) {
                        setState(() {
                          problemId = selectedProblem;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () => searchPicture(),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                height: 200.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Username: ${_displayName ?? "NA"}"),
                              Text("Email: ${_email ?? "NA"}"),
                              Text("Phone Number: ${_phNo ?? "NA"}"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      SizedBox(
                        height: 200.0,
                        width: 200.0,
                        child: Card(
                          child: _problemPictureUrl != null
                              ? Image.network(_problemPictureUrl!, loadingBuilder: (context, child, loadingProgress) {
                                if(loadingProgress==null) return child;
                                return CircularProgressIndicator();
                              },)
                              : Image.asset('assets/images/defaultAvatar.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              SizedBox(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () => markComplete(),
                  child: Text(
                    "Mark as Completed",
                    style: TextStyle(color: Colors.black, fontSize: 24.0),
                  ),
                ),
              ),
              const SizedBox(height: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
