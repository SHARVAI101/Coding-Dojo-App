import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final pages = [
    SkOnboardingModel(
        title: 'WELCOME',
        description:'The Coding Dojo is a Sanctuary to build your Coding Logic',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboarding1.png'),
    SkOnboardingModel(
        title: 'START & SOLVE',
        description: 'Start the timer and solve the question on your PC using any coding language',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboarding2.png'),
    SkOnboardingModel(
        title: 'RANK UP',
        description: 'Solve all the questions to Rank Up from White Belt to Legendary Shogun',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/rank_icons/8.png'),
    SkOnboardingModel(
        title: 'ANALYZE',
        description: 'Track improvements using Intuitive Graphs and Build your Logic today!',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/onboarding4.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: const Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          Future<void> setIntroSeen() async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('onBoardingSeen', true);
            await prefs.setInt('points', 0);
            await prefs.setInt('rank', 0);

            List<int> completion_status = List.filled(GlobalVariables.questionslist.length, 0);
            List<String> completion_status_string=  completion_status.map((i)=>i.toString()).toList();
            await prefs.setStringList('completion_status', completion_status_string);

            List<double> timetakenlist = List.filled(GlobalVariables.questionslist.length, 0.0);
            List<String> timetakenlist_string=  timetakenlist.map((i)=>i.toString()).toList();
            await prefs.setStringList('timetakenlist', timetakenlist_string);
          }
          setIntroSeen();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        getStartedClicked: (value) {
          Future<void> setIntroSeen() async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('onBoardingSeen', true);
            await prefs.setInt('points', 0);
            await prefs.setInt('rank', 0);

            List<int> completion_status = List.filled(GlobalVariables.questionslist.length, 0);
            List<String> completion_status_string=  completion_status.map((i)=>i.toString()).toList();
            await prefs.setStringList('completion_status', completion_status_string);

            List<double> timetakenlist = List.filled(GlobalVariables.questionslist.length, 0.0);
            List<String> timetakenlist_string=  timetakenlist.map((i)=>i.toString()).toList();
            await prefs.setStringList('timetakenlist', timetakenlist_string);
          }
          setIntroSeen();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      ),
    );
  }
}
