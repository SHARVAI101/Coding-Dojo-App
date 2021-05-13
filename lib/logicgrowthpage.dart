import 'dart:async';
import 'dart:convert';

import 'package:coding_dojo_app/basics_page.dart';
import 'package:coding_dojo_app/conditions_page.dart';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/homepage_rank.dart';
import 'package:coding_dojo_app/java_math_page.dart';
import 'package:coding_dojo_app/loops_page.dart';
import 'package:coding_dojo_app/numbers_page.dart';
import 'package:flutter/material.dart';
import 'package:coding_dojo_app/basic_question_1_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogicGrowthPage extends StatefulWidget {
  @override
  _LogicGrowthPageState createState() => _LogicGrowthPageState();
}

class _LogicGrowthPageState extends State<LogicGrowthPage> {

  var _level = GlobalVariables.level; // 0: beginner 1: moderate to pro

  var basics_questions = [
    ["bq0.5"],
    ["bq0.75"],
    ["bq1"],
    ["bq1.5"],
    ["bq1.51"],
    ["bq2"],
  ];
  double basics_percent = 0.0;
  int total_basics_done = 0;

  var jm_questions = [
    ["jmq1"],
    ["jmq2"],
    ["jmq3"],
    ["jmq4"],
    ["jmq5"],
    ["jmq6"],
    ["jmq7"],
    ["jmq8"],
    ["jmq9"],
    ["jmq10"],
  ];
  double jm_percent = 0.0;
  int total_jm_done = 0;

  var con_questions = [
    ["conq1"],
    ["conq2"],
    ["conq3"],
    ["conq4"],
  ];
  double con_percent = 0.0;
  int total_con_done = 0;

  var nmb_questions = [
    ["nmbq1"],
  ];
  double nmb_percent = 0.0;
  int total_nmb_done = 0;

  Future<void> checkcompletedquestions() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("completedbasicquestions")!=null) {
      total_basics_done=0; // reset this or every time, we'll keep adding to the previous value
      var completedbasicquestions = jsonDecode(prefs.getString("completedbasicquestions"));
      for (int i = 0; i < completedbasicquestions.length; i++) {
        for (int j = 0; j < basics_questions.length; j++) {
          if (completedbasicquestions[i] == basics_questions[j][0]) {
            total_basics_done+=1;
            break;
          }
        }
      }
      basics_percent = total_basics_done / basics_questions.length;
    }
    print("total_basics_done="+total_basics_done.toString());
    print("basics_questions.length="+basics_questions.length.toString());

    if(prefs.getString("completed_jm_questions")!=null) {
      total_jm_done=0; // reset this or every time, we'll keep adding to the previous value
      var completed_jm_questions = jsonDecode(prefs.getString("completed_jm_questions"));
      for (int i = 0; i < completed_jm_questions.length; i++) {
        for (int j = 0; j < jm_questions.length; j++) {
          if (completed_jm_questions[i] == jm_questions[j][0]) {
            total_jm_done+=1;
            break;
          }
        }
      }
      jm_percent = total_jm_done / jm_questions.length;
    }

    if(prefs.getString("completed_conds_questions")!=null) {
      total_con_done=0; // reset this or every time, we'll keep adding to the previous value
      var completed_conds_questions = jsonDecode(prefs.getString("completed_conds_questions"));
      for (int i = 0; i < completed_conds_questions.length; i++) {
        for (int j = 0; j < con_questions.length; j++) {
          if (completed_conds_questions[i] == con_questions[j][0]) {
            total_con_done+=1;
            break;
          }
        }
      }
      con_percent = total_con_done / con_questions.length;
    }

    if(prefs.getString("completed_nmb_questions")!=null) {
      total_nmb_done=0; // reset this or every time, we'll keep adding to the previous value
      var completed_nmb_questions = jsonDecode(prefs.getString("completed_nmb_questions"));
      for (int i = 0; i < completed_nmb_questions.length; i++) {
        for (int j = 0; j < nmb_questions.length; j++) {
          if (completed_nmb_questions[i] == nmb_questions[j][0]) {
            total_nmb_done+=1;
            break;
          }
        }
      }
      nmb_percent = total_nmb_done / nmb_questions.length;
    }

    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();

    new Timer(new Duration(milliseconds: 100), () {
      checkcompletedquestions();

      if(GlobalVariables.isOnboardingOn==true){
        //that means, the onboarding process is going on
        print("onboarding on");
        if(GlobalVariables.level==0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BasicsPage()),
          ).then((value) {
            setState(() {
              checkcompletedquestions();
              print("setting lg state");
            });
          });
        }
        else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NumbersPage()),
          ).then((value) {
            setState(() {
              checkcompletedquestions();
            });
          });
        }
      }
    });

  }

  Future<void> setUserLevel(_level) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('level', _level);
    GlobalVariables.level=_level;

    print("level="+prefs.getInt('level').toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "LOGIC GROWTH",
//           style: TextStyle(
//             color: Colors.grey[200],
//           ),
//         ),
// //          backgroundColor: Color(0xFFE62A6E),
//         backgroundColor: Color(0xFF18214C),
//         elevation: 50.0,
//         actions: <Widget>[
//
//         ],
//         leading: IconButton(
//           onPressed: (){
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.grey[200],
//             size: 20,
//           ),
//         ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0,20,0,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
//                    Padding(
//                      padding: const EdgeInsets.only(left: 24.0),
//                      child: Text(
//                        "WELCOME TO THE,",
//                        style: GoogleFonts.montserrat(
//                          // fontFamily: 'FreeSans',
//                            fontSize: 11,
//                            color: Colors.grey[600]
//                        ),
//                      ),
//                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Coding Dojo",
                        style: GoogleFonts.muli(
                          // fontFamily: 'FreeSans',
                          fontSize: 33,
                          color: Colors.grey[800]
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePageRank()),
                      );
                    },
                    child: CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 4.0,
                      percent: (GlobalVariables.points - GlobalVariables.rankslist[GlobalVariables.rank][3])/200,
                      center: Image.asset(
                        GlobalVariables.ranks_smallicons_list[GlobalVariables.rank][0],
                        width: 35,
                        fit: BoxFit.cover,
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.grey[300].withOpacity(0.7),
                      progressColor: Color(0xff45aaf2),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10.0),
                //   child: Image.asset(
                //     GlobalVariables.ranks_smallicons_list[GlobalVariables.rank][0],
                //     width: 40,
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ],
            ),
            // SizedBox(height: 35),
            SizedBox(height: 15),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, right: 10, left: 20),
                  child: Text(
                    "LEVEL :",
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ),
                (_level==0)?SizedBox(
                  height: 30,
                  child: RaisedButton(
                    padding: EdgeInsets.only(left:10),
                    onPressed: (){
                      _level = 0;
                      setState(() {});
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xff27ae60),
                        width: 2
                      )
                    ),
                    color: Colors.white,
                    textColor: Color(0xff27ae60),
                    // textColor :color: Color(0xff0984e3),
                    child: Wrap(
                      children: [
                        Icon(
                          Icons.check,
                          color: Color(0xff27ae60),
                          size: 17,
                        ),
                        SizedBox(width:5),
                        Text(
                          'Beginner'
                        ),
                        SizedBox(width:15)
                      ],
                    )
                  ),
                ):SizedBox(
                  height: 30,
                  child: RaisedButton(
                      onPressed: (){
                        _level = 0;
                        setState(() {});
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: Colors.grey[300],
                              width: 2
                          )
                      ),
                      color: Colors.white,
                      textColor: Colors.blueGrey,
                      // textColor :color: Color(0xff0984e3),
                      child: Text(
                          'Beginner'
                      )
                  ),
                ),
                SizedBox(width:7),
                (_level==1)?SizedBox(
                  height: 30,
                  child: RaisedButton(
                      padding: EdgeInsets.only(left:10),
                      onPressed: (){
                        _level = 1;
                        setUserLevel(_level);
                        setState(() {});
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: Color(0xff27ae60),
                              width: 2
                          )
                      ),
                      color: Colors.white,
                      textColor: Color(0xff27ae60),
                      // textColor :color: Color(0xff0984e3),
                      child: Wrap(
                        children: [
                          Icon(
                            Icons.check,
                            color: Color(0xff27ae60),
                            size: 17,
                          ),
                          SizedBox(width:5),
                          Text(
                              'Moderate'
                          ),
                          SizedBox(width:15)
                        ],
                      )
                  ),
                ):SizedBox(
                  height: 30,
                  child: RaisedButton(
                      onPressed: (){
                        _level = 1;
                        setUserLevel(_level);
                        setState(() {});
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                              color: Colors.grey[300],
                              width: 2
                          )
                      ),
                      color: Colors.white,
                      textColor: Colors.blueGrey,
                      // textColor :color: Color(0xff0984e3),
                      child: Text(
                          'Moderate'
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height: 22),
            Flexible(
              child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                    int sensitivity = 8;
                    if (details.delta.dx > sensitivity) {
                      // Right Swipe
                      _level = 0;
                      setUserLevel(_level);
                      setState(() {});
                    } else if(details.delta.dx < -sensitivity){
                      //Left Swipe
                      _level = 1;
                      setUserLevel(_level);
                      setState(() {});
                    }
                  },
                child: ListView(
                  padding: EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height:10),
                    // (_level==0)?Padding(
                    //   padding: const EdgeInsets.only(left: 0.0, bottom: 10),
                    //   child: Text(
                    //     'For beginners,',
                    //     style: GoogleFonts.muli(
                    //       fontSize: 18,
                    //       color: Colors.grey[500]
                    //     ),
                    //   ),
                    // ):Container(),
                    (_level==0)?Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        width: double.infinity,
                        // height: 130.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xff007991), Color(0xff96c93d)],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[500],
                              offset: Offset(2.0, 4.5),
                              blurRadius:3,
                            ),
                          ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BasicsPage()),
                              ).then((value) {
                                setState(() {
                                  checkcompletedquestions();
                                  print("setting lg state");
                                });
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20,25,20,25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Basics",
                                    style: GoogleFonts.muli(
                                      // fontFamily: 'FreeSans',
                                      fontSize: 26,
                                      color: Colors.grey[100]
                                    ),
                                  ),
                                  SizedBox(height:5),
                                  Text(
                                    "This chapter covers the basics of programming in Java",
                                    style: TextStyle(
                                      // fontFamily: 'FreeSans',
                                        fontSize: 16,
                                        color: Colors.grey[100]
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        total_basics_done.toString()+"/"+basics_questions.length.toString()+" Completed",
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.montserrat(
                                          // fontFamily: 'FreeSans',
                                            fontSize: 10,
                                            color: Colors.grey[200]
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  LinearPercentIndicator(
                                    // padding: EdgeInsets.all(0),
                                    //width: MediaQuery.of(context).size.width-,
                                    lineHeight: 4,
                                    percent: basics_percent,
                                    linearStrokeCap: LinearStrokeCap.roundAll,
                                    progressColor:  Colors.grey[200],
                                    backgroundColor:Colors.grey[300].withOpacity(0.3),
                                  ),
                                ],
                              ),
                            )
                          ),
                        ),
                      ),
                    ):Container(),
                    (_level==0)?SizedBox(height: 22):Container(),
                    (_level==0)?Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        width: double.infinity,
                        // height: 130.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[Color(0xffff9966), Color(0xffff5e62)],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500],
                                offset: Offset(2.0, 4.5),
                                blurRadius:3,
                              ),
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => JavaMathPage()),
                                ).then((value) {
                                  setState(() {
                                    checkcompletedquestions();
                                  });
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,25,20,25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Java Math",
                                      style: GoogleFonts.muli(
                                        // fontFamily: 'FreeSans',
                                          fontSize: 26,
                                          color: Colors.grey[100]
                                      ),
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Use various operations to solve mathematical problems",
                                      style: TextStyle(
                                        // fontFamily: 'FreeSans',
                                          fontSize: 16,
                                          color: Colors.grey[100]
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          total_jm_done.toString()+"/"+jm_questions.length.toString()+" Completed",
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.montserrat(
                                            // fontFamily: 'FreeSans',
                                              fontSize: 10,
                                              color: Colors.grey[200]
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    LinearPercentIndicator(
                                      // padding: EdgeInsets.all(0),
                                      //width: MediaQuery.of(context).size.width-,
                                      lineHeight: 4,
                                      percent: jm_percent,
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                      progressColor:  Colors.grey[200],
                                      backgroundColor:Colors.grey[300].withOpacity(0.3),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      ),
                    ):Container(),
                    (_level==0)?SizedBox(height: 22):Container(),
                    (_level==0)?Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        width: double.infinity,
                        // height: 130.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[Color(0xff642B73), Color(0xffC6426E)],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500],
                                offset: Offset(2.0, 4.5),
                                blurRadius:3,
                              ),
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ConditionsPage()),
                                ).then((value) {
                                  setState(() {
                                    checkcompletedquestions();
                                  });
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,25,20,25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Conditions",
                                      style: GoogleFonts.muli(
                                        // fontFamily: 'FreeSans',
                                          fontSize: 26,
                                          color: Colors.grey[100]
                                      ),
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Use conditions to make decisions in programs",
                                      style: TextStyle(
                                        // fontFamily: 'FreeSans',
                                          fontSize: 16,
                                          color: Colors.grey[100]
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          total_con_done.toString()+"/"+con_questions.length.toString()+" Completed",
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.montserrat(
                                            // fontFamily: 'FreeSans',
                                              fontSize: 10,
                                              color: Colors.grey[200]
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    LinearPercentIndicator(
                                      // padding: EdgeInsets.all(0),
                                      //width: MediaQuery.of(context).size.width-,
                                      lineHeight: 4,
                                      percent: con_percent,
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                      progressColor:  Colors.grey[200],
                                      backgroundColor:Colors.grey[300].withOpacity(0.3),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      ),
                    ):Container(),
                    // (_level==0)?SizedBox(height: 20):Container(),
                    // (_level==0)?Container(
                    //   width: double.infinity,
                    //   // height: 130.0,
                    //   decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: <Color>[Color(0xff6D214F), Color(0xffB33771)],
                    //       ),
                    //       borderRadius: BorderRadius.all(Radius.circular(20)),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey[500],
                    //           offset: Offset(2.0, 4.5),
                    //           blurRadius:3,
                    //         ),
                    //       ]
                    //   ),
                    //   child: Material(
                    //     color: Colors.transparent,
                    //     child: InkWell(
                    //         onTap: (){
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(builder: (context) => LoopsPage()),
                    //           ).then((value) {
                    //             setState(() {
                    //
                    //             });
                    //           });
                    //         },
                    //         child: Padding(
                    //           padding: const EdgeInsets.fromLTRB(20,25,20,35),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 "Loops",
                    //                 style: GoogleFonts.muli(
                    //                   // fontFamily: 'FreeSans',
                    //                     fontSize: 26,
                    //                     color: Colors.grey[200]
                    //                 ),
                    //               ),
                    //               SizedBox(height:5),
                    //               Text(
                    //                 "Simplifying difficult tasks and making programs efficient using loops",
                    //                 style: TextStyle(
                    //                   // fontFamily: 'FreeSans',
                    //                     fontSize: 16,
                    //                     color: Colors.grey[200]
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         )
                    //     ),
                    //   ),
                    // ):Container(),

                    // (_level==1)?Padding(
                    //   padding: const EdgeInsets.only(left: 0.0, bottom: 10),
                    //   child: Text(
                    //     'For amateurs and pros,',
                    //     style: GoogleFonts.muli(
                    //         fontSize: 18,
                    //         color: Colors.grey[500]
                    //     ),
                    //   ),
                    // ):Container(),
                    (_level==1)?Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Container(
                        width: double.infinity,
                        // height: 130.0,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[Color(0xffB33771), Color(0xffFD7272)],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[500],
                                offset: Offset(2.0, 4.5),
                                blurRadius:3,
                              ),
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NumbersPage()),
                                ).then((value) {
                                  setState(() {
                                    checkcompletedquestions();
                                  });
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20,25,20,35),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Numbers",
                                      style: GoogleFonts.muli(
                                        // fontFamily: 'FreeSans',
                                          fontSize: 26,
                                          color: Colors.grey[200]
                                      ),
                                    ),
                                    SizedBox(height:5),
                                    Text(
                                      "Learn to use basic Java knowledge to carry out complex mathematics",
                                      style: TextStyle(
                                        // fontFamily: 'FreeSans',
                                          fontSize: 16,
                                          color: Colors.grey[200]
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          total_nmb_done.toString()+"/"+nmb_questions.length.toString()+" Completed",
                                          textAlign: TextAlign.right,
                                          style: GoogleFonts.montserrat(
                                            // fontFamily: 'FreeSans',
                                              fontSize: 10,
                                              color: Colors.grey[200]
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    LinearPercentIndicator(
                                      // padding: EdgeInsets.all(0),
                                      //width: MediaQuery.of(context).size.width-,
                                      lineHeight: 4,
                                      percent: nmb_percent,
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                      progressColor:  Colors.grey[200],
                                      backgroundColor:Colors.grey[300].withOpacity(0.3),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      ),
                    ):Container(),

                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 20, bottom: 20),
                      child: Text(
                          '\n\nMore chapters and questions are \ncoming in a few days!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 15,
                          )
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// good color combination
// colors: <Color>[Color(0xff227093), Color(0xff34ace0)],