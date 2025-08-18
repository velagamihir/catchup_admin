import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart' as intro;

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int _currentIndex = 0;
  final introKey = GlobalKey<intro.IntroductionScreenState>();
  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: intro.IntroductionScreen(
        key: introKey,
        onDone: () => Navigator.pushNamedAndRemoveUntil(
          context,
          '/main',
          (route) => false,
        ),
        showDoneButton: _currentIndex == 4 && checkBox,
        done: Text("Done"),
        onSkip:  () => introKey.currentState?.animateScroll(4),
        skip: Text("Skip"),
        showSkipButton: true,
        onChange: (int valueChanged) {
          setState(() {
            _currentIndex = valueChanged;
          });
        },
        showNextButton: true,
        next: Text("Next"),
        pages: [
          intro.PageViewModel(
            title: "Terms and Conditions",
            body:
                "Welcome to GeoResolve, This user policy, outlines the terms and conditions for using our application within your college community. By accessing or using GeoResolve, you agree to comply with and be bound by the following policy.\n\n1. Purpose of GeoResolve\nGeoResolve is designed to facilitate secure and efficient communication between students and college authorities regarding various campus concerns. This includes, but is not limited to, reporting grievances, behavorial issues, academic concerns, or infrastructure problems within the college premises. The app aims to foster a more responsive and accountable college environment.",
          ),
          intro.PageViewModel(
            title: "",
            bodyWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2. User Responsibilities",
                  style: TextStyle(color: Colors.black, fontSize: 24.0),
                ),
                Text("As a user of GeoResolve, you agree to:"),
                const SizedBox(height: 20.0),
                Text(
                  "Provide Accurate information: All reports and information submitted must be accurate, truthful, and based on genuine observations. Do not submit false, misleading, or fabricated reports. Misuse of the platform can lead to disciplinary action by the college.",
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Use respectful Language: All communications within the app, including report descriptions and any interactions(if enabled), must be respectful, courteous, and free from abusive, offensive , discriminatory, or harassing language.",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Submit Relevant Concerns: Only submit issues directly related to the college environment and its community. Issues outside this scope should be directed through appropriate college channels or external authorities.",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Avoid Malicious Use: Do not use GeoResolve for any unlawful, fraudulent, or malicious activities, including but not limited to submitting spam, multiple duplicate reports for the same issue without justification, or attempting to disrupt the system.",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Protect Your Account: You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account. Notify us and the college authorities immediately of any unauthorized use of your account.",
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ),
          intro.PageViewModel(
            title: "",
            bodyWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "3. Prohibited Content and Conduct",
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "The following content and conduct are strictly prohibited on GeoResolve:",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "False Reporting: Submitting reports that you know to be false, inaccurate, or intended to mislead college authorities.",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Personal Attacks & Harassment: Any form of personal attack, harassment, intimidation, or bullying directed at other students, faculty, staff, or any individual.",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Hate Speech & Discrimination: Content that promotes hatred, discrimination, or violence based on caste, religion, gender, sexual orientation, disability, or any other protected characteristic.",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Spam & Commercial Content: Unsolicited advertisements, promotional materials, or any form of spam.",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Illegal Activities: Promoting or engaging in any activities that are illegal under Indian law or the college's code of conduct.",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Privacy Violations: Sharing personal or sensitive information about others without their explicit consent.",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Impersonation: Pretending to be someone else or misrepresenting your affiliation with any person or entity.",
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(height: 20.0),
                Text("4. Data Privacy", style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 20.0),
                Text('''
Information Collection: We collect information you provide when you register, submit reports (e.g., descriptions, attached media), and interact with the app. This may include personal information required for identification and follow-up by college authorities.

Use of Data: Your data, particularly report details and any identifying information, will be shared with the relevant college authorities (e.g., grievance committee, discipline committee, concerned department heads) to facilitate the investigation and resolution of the reported issues. We may also use anonymized or aggregated data for analytical purposes to improve the service and college operations.

Data Security: We are committed to protecting your data. We implement reasonable security measures to safeguard your information from unauthorized access, disclosure, alteration, and destruction.

Confidentiality: We strive to maintain the confidentiality of your reports where appropriate and requested, though disclosure may be necessary for investigation and resolution by college authorities.

No Personal Sale: We will not sell your personal information to third parties.
'''),
              ],
            ),
          ),
          intro.PageViewModel(
            title: "",
            bodyWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Text(
                  "5. Report Resolution Process",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text('''
GeoResolve acts as a secure communication channel. While we ensure your report is submitted to the appropriate college authority and allow for tracking, we do not directly control the speed, method, or outcome of resolution by the college.

The timeline for addressing and resolving issues is at the discretion of the relevant college department or committee.

The app allows college authorities to update the status of a report, indicating its progress and eventual completion.
'''),
                const SizedBox(height: 20.0),
                Text(
                  "Disclaimer of Warranties",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text('''
                
GeoResolve is provided "as is" and "as available" without any warranties, express or implied. We do not guarantee that the app will be error-free, uninterrupted, or that all reported issues will be resolved to your satisfaction.
'''),
                const SizedBox(height: 20.0,),
                Text('''
7. Limitation of Liability
To the fullest extent permitted by applicable law, in no event shall GeoResolve, its affiliates, directors, employees, partners, agents, suppliers, or licensors be liable for any direct, indirect, incidental, special, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses, resulting from (i) your access to or use of or inability to access or use the Service; (ii) any conduct or content of any third party on the Service; (iii) any content obtained from the Service; and (iv) unauthorized access, use, or alteration of your transmissions or content, whether based on warranty, contract, tort (including negligence), or any other legal theory, whether or not we have been informed of the possibility of such damage.

''')
              ],
            ),
          ),

          intro.PageViewModel(
            title: "",
            bodyWidget: Column(
              children: [
                Text('''
8. Changes to this Policy

We reserve the right to modify this User Policy at any time. Any changes will be effective immediately upon posting the updated policy within the app. Your continued use of GeoResolve after any such changes constitutes your acceptance of the new policy.
'''),
                Text('''
                
                
9. Termination of Access
We reserve the right to suspend or terminate your access to GeoResolve at our sole discretion, without prior notice, if you violate any part of this User Policy or engage in conduct that we deem harmful to the app, other users, or college authorities. The college administration may also request termination of access based on their policies.

'''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Agree to Terms and Conditions"),
                    Checkbox(
                      checkColor: Colors.white,
                      value: checkBox,
                      onChanged: (bool? valueCheck) {
                        setState(() {
                          checkBox = valueCheck!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
