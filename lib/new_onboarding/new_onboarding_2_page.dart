import 'package:coding_dojo_app/basic_question_0_point_5_page.dart';
import 'package:coding_dojo_app/basics_page.dart';
import 'package:coding_dojo_app/bottomnav_page.dart';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewOnboarding2Page extends StatefulWidget {
  @override
  _NewOnboarding2PageState createState() => _NewOnboarding2PageState();
}

class _NewOnboarding2PageState extends State<NewOnboarding2Page> {

  var _optionSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery. of(context). size. height,
        width: MediaQuery. of(context). size. width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Color(0xffB33771), Color(0xffFD7272)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(2.0, 4.5),
              blurRadius:3,
            ),
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height:100),
                  Text(
                    "WHAT'S YOUR CODING EXPERIENCE?",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      // fontFamily: 'FreeSans',
                        fontSize: 25,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Don't worry, you can change it later.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      // fontFamily: 'FreeSans',
                        fontSize: 15,
                        color: Colors.grey[300]
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: (_optionSelected!=1)?<Color>[Color(0xff8c2b58), Color(0xff8c2b58)]:
                          <Color>[Colors.white, Colors.white],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          (_optionSelected==1)?BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 4.5),
                            blurRadius:3,
                          ):BoxShadow(),
                        ]
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              _optionSelected=1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,25,20,35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Beginner",
                                      style: GoogleFonts.muli(
                                        // fontFamily: 'FreeSans',
                                          fontSize: 26,
                                          color: (_optionSelected!=1)?Colors.white:Colors.grey[800]
                                      ),
                                    ),
                                    (_optionSelected==1)?Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ):Container()
                                  ],
                                ),
                                SizedBox(height:5),
                                Text(
                                  "You have very little or no coding knowledge.",
                                  style: TextStyle(
                                    // fontFamily: 'FreeSans',
                                      fontSize: 16,
                                      color: (_optionSelected!=1)?Colors.grey[300]:Colors.grey[600]
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: (_optionSelected!=2)?<Color>[Color(0xff8c2b58), Color(0xff8c2b58)]:
                          <Color>[Colors.white, Colors.white],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          (_optionSelected==2)?BoxShadow(
                            color: Colors.black38,
                            offset: Offset(2.0, 4.5),
                            blurRadius:3,
                          ):BoxShadow(),
                        ]
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              _optionSelected=2;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20,25,20,35),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Moderate",
                                      style: GoogleFonts.muli(
                                        // fontFamily: 'FreeSans',
                                          fontSize: 26,
                                          color: (_optionSelected!=2)?Colors.white:Colors.grey[800]
                                      ),
                                    ),
                                    (_optionSelected==2)?Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ):Container()
                                  ],
                                ),
                                SizedBox(height:5),
                                Text(
                                  "You have basic coding knowledge and wish to focus on programming logic.",
                                  style: TextStyle(
                                    // fontFamily: 'FreeSans',
                                      fontSize: 16,
                                      color: (_optionSelected!=2)?Colors.grey[300]:Colors.grey[600]
                                  ),
                                ),
                              ],
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),

              // SizedBox(height:60),
              SizedBox(
                width: 250,
                height: 50,
                child: RaisedButton(
                  onPressed: (_optionSelected==0)?null:() async{

                    Future<void> setUserLevel() async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      var op = _optionSelected-1;
                      await prefs.setInt('level', op);

                      //setting other user data
                      await prefs.setBool('onBoardingSeen', true);
                      await prefs.setInt('points', 0);
                      await prefs.setInt('rank', 0);

                      List<int> completion_status = List.filled(GlobalVariables.questionslist.length, 0);
                      List<String> completion_status_string=  completion_status.map((i)=>i.toString()).toList();
                      await prefs.setStringList('completion_status', completion_status_string);

                      List<double> timetakenlist = List.filled(GlobalVariables.questionslist.length, 0.0);
                      List<String> timetakenlist_string=  timetakenlist.map((i)=>i.toString()).toList();
                      await prefs.setStringList('timetakenlist', timetakenlist_string);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BottomNavPage()),
                      );
                    }

                    GlobalVariables.level = _optionSelected-1;
                    GlobalVariables.isOnboardingOn = true;
                    setUserLevel();

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => BasicsPage()),
                    // );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => BasicQuestion0point5()),
                    // );
                  },
                  elevation: (_optionSelected==0)?0:10,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.white,
                  textColor: Colors.green,
                  child: Text(
                    'CONTINUE',
                    style: GoogleFonts.montserrat(
                      fontSize: 15
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
