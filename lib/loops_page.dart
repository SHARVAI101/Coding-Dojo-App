import 'dart:async';
import 'dart:convert';

import 'package:coding_dojo_app/loops_question_1_page.dart';
import 'package:coding_dojo_app/loops_question_2_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoopsPage extends StatefulWidget {
  @override
  _LoopsPageState createState() => _LoopsPageState();
}

class _LoopsPageState extends State<LoopsPage> {

  // var allquestions = [['Your First Program',0,0,1],['Declaring Variables', BasicQuestion1(), 1, 0, "bq1"], ['Loops',0,0,1], ['Running For-Loops', BasicQuestion2(), 0, 0, "bq2"], ['Stopping Loops', BasicQuestion3(), 2, 0, "bq3"]];
  // 0: questionname,
  // 1: object,
  // 2: completionstatus 0 means not done and available, 1 means done, 2 means locked,
  // 3: 0 if it is a question 1 if it is a section heading,
  // 4: uniqueID of this question
  var allquestions = [
    ['Running For-Loops', LoopsQuestion1(), 0, 0, "lpq1"],
    ['Stopping Loops', LoopsQuestion2(), 2, 0, "lpq2"]
  ];
  // here these questions are called basicquestions because they were meant to be basic before but then i changed
  // them to loops

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
    // prefs.remove("completed_loops_questions");
    if(prefs.getString("completed_loops_questions")!=null){
      var completed_loops_questions = jsonDecode(prefs.getString("completed_loops_questions"));
      print("completed_loops_questions="+completed_loops_questions.toString());
      // this contains a list of all the completed questions' uniqueIDs
      for(int i=0;i<completed_loops_questions.length;i++){
        print(completed_loops_questions[i]);
        for(int j=0;j<allquestions.length;j++){
          if(completed_loops_questions[i]==allquestions[j][4]){
            print("in");
            allquestions[j][2]=1; // setting this question's completion status to 1
            break;
          }
        }
      }
      setState(() {

      });

      // unlocking a question
      var _lastquestionsolvedID=completed_loops_questions[completed_loops_questions.length-1];
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                          color: Colors.grey[600].withOpacity(0.8)
                      ),
                    ),
                    Text(
                      "HOME",
                      style: GoogleFonts.montserrat(
                        // fontFamily: 'FreeSans',
                          fontSize: 15,
                          color: Colors.grey[600].withOpacity(0.8)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height:0),
            Text(
              "Loops",
              style: GoogleFonts.muli(
                // fontFamily: 'FreeSans',
                  fontSize: 33,
                  color: Colors.grey[800]
              ),
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
                    padding: const EdgeInsets.only(bottom: 0),
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
          ],
        ),
      ),
    );
  }
}
