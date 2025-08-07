import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart' as intro;
class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}
class _IntroductionScreenState extends State<IntroductionScreen> {
int _currentIndex=0;
bool checkBox=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: intro.IntroductionScreen(
        onDone: ()=>Navigator.pushNamedAndRemoveUntil(context, '/main', (route)=>false),
        showDoneButton: _currentIndex==2 && checkBox,
        done: Text("Done"),
        onSkip: ()=>SystemNavigator.pop(),
        skip: Text("Close"),
        showSkipButton: true,
        onChange: (int valueChanged){
          setState(() {
            _currentIndex=valueChanged;
          });
        },
        showNextButton: true,
        next: Text("Next"),
        pages: [
          intro.PageViewModel(
            title: "Page 1",
            body: "Hello, Page 1",
          ),
          intro.PageViewModel(
            title: "Page 2",
            body: "Hello, Page 2",
          ),
          intro.PageViewModel(
            title: "Page 3",
            bodyWidget: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Agree Terms and Conditions"),
                      Checkbox(
                        checkColor: Colors.white,
                          value: checkBox, onChanged: (bool? valueCheck){
                            setState(() {
                              checkBox=valueCheck!;
                            });
                      }
                      ),
                    ],
                  ),
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
