import 'dart:async';
import 'dart:convert';

import 'package:coding_dojo_app/conditions_questions/conditions_question_1_page.dart';
import 'package:coding_dojo_app/conditions_questions/conditions_question_2_page.dart';
import 'package:coding_dojo_app/conditions_questions/conditions_question_3_page.dart';
import 'package:coding_dojo_app/conditions_questions/conditions_question_4_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class ConditionsPage extends StatefulWidget {
  @override
  _ConditionsPageState createState() => _ConditionsPageState();
}

class _ConditionsPageState extends State<ConditionsPage> {

  // 0: questionname,
  // 1: object,
  // 2: completionstatus 0 means not done and available, 1 means done, 2 means locked,
  // 3: 0 if it is a question 1 if it is a section heading,
  // 4: uniqueID of this question
  var allquestions = [
    ['If statements', ConditionsQuestion1(), 0, 0, "conq1"],
    ['Relations', ConditionsQuestion2(), 2, 0, "conq2"],
    ['Relations 2', ConditionsQuestion3(), 2, 0, "conq3"],
    ['If-else', ConditionsQuestion4(), 2, 0, "conq4"],
  ];

  @override
  void initState() {
    super.initState();

    new Timer(new Duration(milliseconds: 100), () {
      setAllQuestions();
    });
  }

  Future<void> setAllQuestions() async{
    print("hi");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove("completed_conds_questions");
    if(prefs.getString("completed_conds_questions")!=null){
      var completed_conds_questions = jsonDecode(prefs.getString("completed_conds_questions"));
      print("completed_conds_questions="+completed_conds_questions.toString());
      // this contains a list of all the completed questions' uniqueIDs
      for(int i=0;i<completed_conds_questions.length;i++){
        print(completed_conds_questions[i]);
        for(int j=0;j<allquestions.length;j++){
          if(completed_conds_questions[i]==allquestions[j][4]){
            print("in");
            allquestions[j][2]=1; // setting this question's completion status to 1
            break;
          }
        }
      }
      setState(() {

      });

      // unlocking a question
      var _lastquestionsolvedID=completed_conds_questions[completed_conds_questions.length-1];
      for (int i = 0; i < allquestions.length; i++) {
        if (allquestions[i][4] == _lastquestionsolvedID) {
          if((i+1)<allquestions.length) {
            if(allquestions[i+1][2]!=1) {
              allquestions[i + 1][2] = 0;
            }
          }
          setState(() {

          });
          break;
        }
      }
      // }
    }
  }

  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Color(0xFF3498db),
        title: Text(
          "TUTORIAL",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 30
          ),
        ),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        content: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                  "assets/images/theory_tut_1.jpg"
              ),
            ),
            SizedBox(height:5),
            Text(
              "Solve the given question by filling these blanks.",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 15
              ),
            ),
            SizedBox(height:20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                  "assets/images/theory_tut_2.jpg"
              ),
            ),
            SizedBox(height:5),
            Text(
              "Click on these choices to fill the blanks.",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 15
              ),
            ),
            SizedBox(height:20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                  "assets/images/theory_tut_3.jpg"
              ),
            ),
            SizedBox(height:5),
            Text(
              "To remove a filled blank, just click on it again.",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 15
              ),
            ),
            // SizedBox(height:20),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(0.0),
            //   child: Image.asset(
            //     "assets/images/theory_tut_4.jpg",
            //     height: 70,
            //   ),
            // ),
            // SizedBox(height:5),
            // Text(
            //   "The blank highlighted in green is the current blank and it is the blank that will get filled.",
            //   style: GoogleFonts.montserrat(
            //       color: Colors.white,
            //       fontSize: 15
            //   ),
            // ),
            // SizedBox(height:5),
            // Text(
            //   "Click on any blank to make it the current blank and fill it.",
            //   style: GoogleFonts.montserrat(
            //       color: Colors.white,
            //       fontSize: 15
            //   ),
            // ),
          ],
        ),
        actions: [
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              color: Color(0xff2d3436),
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text(
                "LET'S BEGIN!",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: <Color>[Color(0xffFD7272), Color(0xffB33771)],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20,20,20,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SizedBox(
                width: 100,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:2),
                        child: Icon(
                            Icons.chevron_left,
                            color: Colors.grey[300].withOpacity(0.8)
                        ),
                      ),
                      Text(
                        "HOME",
                        style: GoogleFonts.montserrat(
                          // fontFamily: 'FreeSans',
                            fontSize: 15,
                            color: Colors.grey[300].withOpacity(0.8)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Conditions",
                    style: GoogleFonts.muli(
                      // fontFamily: 'FreeSans',
                        fontSize: 33,
                        color: Colors.grey[800]
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    child: RaisedButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('lgTutorialSeen', true);
                        // prefs.remove("lgTutorialSeen");
                        _showDialog();
                      },
                      color: Color(0xFF18214C),
                      textColor: Colors.grey[200],
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                      child: Text(
                          "Tutorial",
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                          )
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 25),
              Flexible(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  scrollDirection: Axis.vertical,
                  children: allquestions.map((thisquestion){
                    bool _showarrow = true;
                    if(allquestions.indexOf(thisquestion)==0){
                      _showarrow=false;
                    }
                    return Padding(
                      padding: (allquestions.indexOf(thisquestion)==allquestions.length-1)?const EdgeInsets.only(bottom: 20):const EdgeInsets.only(bottom: 0),
                      child: Column(
                        children: [
                          (_showarrow==false)?Container():RotatedBox(
                            quarterTurns: 2,
                            child: Image.asset(
                              'assets/images/brokenline.png',
                              height: 50,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: (thisquestion[2] == 2)
                                    ? Colors.grey[300]
                                    : Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20)),
                                border: Border.all(
                                  color: (thisquestion[2] == 2) ? Colors
                                      .grey[300] : (thisquestion[2] == 1)
                                      ? Color(0xff3dc1d3)
                                      : Color(0xfffa8231),
                                  width: 2.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: (thisquestion[2] == 2)
                                        ? Colors.white
                                        : Colors.grey[500],
                                    offset: Offset(1.0, 1.5),
                                    blurRadius: 5,
                                  ),
                                ]
                            ),
                            child: InkWell(
                                onTap: (thisquestion[2] == 2) ? null : ()  {
                                  void callpage(nextquestionuniqueID) {
                                    var _nextquestionIndex=0;
                                    for(int i=0;i<allquestions.length;i++){
                                      if(allquestions[i][4]==nextquestionuniqueID){
                                        _nextquestionIndex=i;
                                        break;
                                      }
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => allquestions[_nextquestionIndex][1]),
                                    ).then((value) {
                                      setState(() {
                                        print("setting state");
                                        // allquestions[0][2]=0;
                                        // ikde set kar allquestions chya proper values so that basics cha page update hoil
                                        setAllQuestions();
                                      });

                                      print("return value=" + value.toString());
                                      //this value has the uniqueID of the next question to go to
                                      if (value.toString() != "null") {
                                        callpage(value);
                                      }
                                    });
                                  }
                                  callpage(thisquestion[4]);
                                },
                                child: ListTile(
                                  title: Text(
                                    thisquestion[0],
                                    style: GoogleFonts.muli(
                                      // fontFamily: 'FreeSans',
                                        fontSize: 23,
                                        color: Colors.grey[800]
                                    ),
                                  ),
                                  trailing: (thisquestion[2] == 2) ?
                                  Icon(
                                    Icons.lock,
                                    color: Colors.grey[800],
                                  ) :
                                  (thisquestion[2] == 1) ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ) : Icon(
                                    // Icons.lightbulb_outline,
                                    Icons.lock_open,
                                    color: Color(0xfffa8231),
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                    );
                    // }
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20, top: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      'More chapters and questions are \ncoming in a few days!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
