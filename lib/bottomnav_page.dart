import 'dart:async';

import 'package:coding_dojo_app/allchapterspage.dart';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/homepage.dart';
import 'package:coding_dojo_app/logicgrowthpage.dart';
import 'package:flutter/material.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:launch_review/launch_review.dart';
import 'package:rating_dialog/rating_dialog.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {

  @override
  void initState() {
    super.initState();

    // this is done to prevent setState() being called during first widget build
    new Timer(new Duration(milliseconds: 200), () {
      getUserInfo();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var launches=prefs.getInt("launches");
      if(launches==null) {
        await prefs.setInt('launches', 0);
        await prefs.setInt('is_app_reviewed', 0);
        launches=0;
        print("launches set to 0");
      }
      var is_app_reviewed=prefs.getInt("is_app_reviewed");
      launches+=1;
      print("launches="+launches.toString());
      print("is_app_reviewed="+is_app_reviewed.toString());
      if(is_app_reviewed==0 && (launches==3 || launches%10==0)) {
        // launches+=1;
        print("showing dialog");
        showDialog(
            context: context,
            barrierDismissible: true,
            // set to false if you want to force a rating
            builder: (context) {
              return RatingDialog(
                icon: Image.asset(
                    "assets/icons/katana_icon2.png",
                    width: 100,
                    height: 100
                ),
                // set your own image/icon widget
                title: "Do you like the Dojo?",
                description:
                "Please consider dropping a review for this app to help us improve! It helps a lot!",
                submitButton: "SUBMIT",
                //alternativeButton: "Contact us instead?",
                // optional
                positiveComment: "Hell yeah, Samurai!",
                // optional
                negativeComment: "Our swords need more sharpening :(",
                // optional
                accentColor: Colors.red,
                // optional
                onSubmitPressed: (int rating) {
                  print("onSubmitPressed: rating = $rating");
                  setappreviewed();
                  // TODO: open the app's page on Google Play / Apple App Store
                  LaunchReview.launch();
                },
                // onAlternativePressed: () {
                //   print("onAlternativePressed: do something");
                //   // TODO: maybe you want the user to contact you instead of rating a bad review
                //   setappreviewed();
                //   // TODO: open the app's page on Google Play / Apple App Store
                //   LaunchReview.launch();
                // },
              );
            }
        );
      }
      await prefs.setInt('launches', launches);

    });
  }

  Future<void> setappreviewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('is_app_reviewed', 1);
  }

  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _points=await prefs.getInt("points");
    var _rank=await prefs.getInt("rank");
    var _level=await prefs.getInt("level");
    if(_points!=null)
      GlobalVariables.points=prefs.getInt("points");
    else
      GlobalVariables.points=0;

    if(_rank!=null)
      GlobalVariables.rank=prefs.getInt("rank");
    else
      GlobalVariables.rank=0;

    if(_level!=null)
      GlobalVariables.level=prefs.getInt("level");
    else
      GlobalVariables.level=0;

    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
    print("rank="+prefs.getInt("rank").toString());

    List<String> completion_status_string = (prefs.getStringList('completion_status') ?? List<String>()) ;
    List<int> completion_status = completion_status_string.map((i)=> int.parse(i)).toList();
    print("cs length="+completion_status.length.toString());
    if(completion_status.length>0){
      for(int i = 0; i < GlobalVariables.questionslist.length; i++){
        GlobalVariables.questionslist[i][5]=completion_status[i];
      }
    }

    List<String> timetakenlist_string = (prefs.getStringList('timetakenlist') ?? List<String>()) ;
    List<double> timetakenlist = timetakenlist_string.map((i)=> double.parse(i)).toList();
    if(timetakenlist.length>0) {
      for (int i = 0; i < GlobalVariables.questionslist.length; i++) {
        GlobalVariables.questionslist[i][6] = timetakenlist[i];
      }
    }

    setState(() {
    });
  }

  int _currentindex=0;

  Widget callpage(int currentIndex){
    switch(currentIndex){
      case 0: return LogicGrowthPage();
      case 1: return AllChapters();
      case 2: return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: callpage(_currentindex)
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 20,
          currentIndex: _currentindex,
          unselectedItemColor: Colors.grey,
          // selectedItemColor: Colors.tealAccent[700],
          selectedItemColor: Color(0xFF18214C),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30.0,
                // color: Colors.tealAccent[700],
              ),
              // title: SizedBox.shrink(),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                // Icons.map,
                Icons.whatshot,
                // FontAwesomeIcons.map,
                size: 30.0,
              ),
              // title: SizedBox.shrink(),
              title: Text("Hardcore"),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  // Icons.card_travel,
                  Icons.account_circle,
                  size: 30.0,
                ),
                // title: SizedBox.shrink(),
                title: Text("Account")
            ),
          ],
          onTap: (index){
            setState(() {
              _currentindex=index;
            });
          }
      ),
    );
  }
}
