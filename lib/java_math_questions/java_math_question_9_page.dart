import 'dart:convert';

import 'package:coding_dojo_app/beginner_theory/jm_q_5_theory.dart';
import 'package:coding_dojo_app/beginner_theory/jm_q_9_theory.dart';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/rankup_widget.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';

var uniqueID = "jmq9";

class JavaMathQuestion9 extends StatefulWidget {
  @override
  _JavaMathQuestion9State createState() => _JavaMathQuestion9State();
}

class _JavaMathQuestion9State extends State<JavaMathQuestion9> {

  var blanks = [[3, 0, -1],[0, 0, -1],[1, 0, -1],[2, 0, -1]];
  // 0: Correct answer index from options,
  // 1: 0=not filled 1=filled,
  // 2: index of what is currently filled in this blank

  var blanks2 = [[0, 0, -1],[3, 0, -1],[1, 0, -1],[2, 0, -1]];
  // this is the same as blanks but is made if 1 blank could have more than 1 option as its right answer

  var blanks3 = [[0, 0, -1],[3, 0, -1],[2, 0, -1],[1, 0, -1]];
  var blanks4 = [[3, 0, -1],[0, 0, -1],[2, 0, -1],[1, 0, -1]];

  var options = [["b",0],["c",0],["d",0],["a",0]]; // 0: Answer text, 1: 1=selected 0=not selected

  var currentblank = 0;
  var allBlanksFilled = false;

  bool _isAlreadySubmitted = true;

  ConfettiController _controllerCenter;

  @override
  void initState() {
    super.initState();
    // _showDialog();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  //this function constructs every blank
  Widget BlankConstruct(thisblank){
    if(thisblank[1]==0){
      // if it is empty
      return InkWell(
        onTap: (){
          print("clicked");
          currentblank=blanks.indexOf(thisblank);
          setState(() {

          });
        },
        child: FDottedLine(
            color: (currentblank==blanks.indexOf(thisblank))?Colors.green:Colors.black,
            strokeWidth: 1.5,
            dottedLength: 6.0,
            space: 2.0,
            corner: FDottedLineCorner.all(6.0),
            height: 35,
            width: 50,
            /// add widget
            child:(currentblank==blanks.indexOf(thisblank))? Container(
              height: 35,
              width: 50,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.all(Radius.circular(6))
                ),
              ),
            ):null
        ),
      );
    }
    else{
      return FDottedLine(
          color: Colors.black,
          strokeWidth: 1.5,
          dottedLength: 6.0,
          space: 2.0,
          corner: FDottedLineCorner.all(6.0),
          height: 40,
          width: 55,
          /// add widget
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 25,
              width: 40,
              child: RaisedButton(
                padding: EdgeInsets.all(0),
                onPressed: (){
                  if(currentblank >= 0){
                    blanks[blanks.indexOf(thisblank)][1]=0; // not filled
                    options[blanks[blanks.indexOf(thisblank)][2]][1] = 0; // this option is not selected
                    blanks[blanks.indexOf(thisblank)][2]=-1; //no option in this blank

                    // currentblank=blanks.indexOf(thisblank);
                    for(var i=0; i<blanks.length;i++){
                      if(blanks[i][1]==0){
                        currentblank = i;
                        break;
                      }
                    }

                    allBlanksFilled=false;
                    setState(() {

                    });
                  }
                },
                child: Text(
                  options[thisblank[2]][0],

                ),
              ),
            ),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 40),
            SizedBox(height: 30),
            Text(
              "CHAPTER: JAVA MATH",
              style: GoogleFonts.montserrat(
                // fontFamily: 'FreeSans',
                  fontSize: 13,
                  color: Colors.grey[600].withOpacity(0.8)
              ),
            ),
            SizedBox(height:7),
            Text(
              "Minimum Number",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 30,
              ),
            ),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(
                  text: "You are given 2 integer variables ",
                  style: TextStyle( fontFamily: 'FreeSans', fontSize: 15, color:Colors.black),
                  children: [
                    TextSpan(text: 'a', style: TextStyle(color:Colors.pink)),
                    TextSpan(text: ' and '),
                    TextSpan(text: 'b', style: TextStyle(color:Colors.pink)),
                    TextSpan(text: ' and 2 double variables '),
                    TextSpan(text: 'c', style: TextStyle(color:Colors.pink)),
                    TextSpan(text: ' and '),
                    TextSpan(text: 'd', style: TextStyle(color:Colors.pink)),
                    TextSpan(text: '.'),
                  ]
              ),
            ),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(
                  text: "Find the minimum of ",
                  style: TextStyle( fontFamily: 'FreeSans', fontSize: 15, color:Colors.black),
                  children: [
                    TextSpan(text: 'a', style: TextStyle(color:Colors.pink)),
                    TextSpan(text: ' and '),
                    TextSpan(text: 'b', style: TextStyle(color:Colors.pink)),
                    TextSpan(text: ' and the minimum of '),
                    TextSpan(text: 'c', style: TextStyle(color:Colors.pink)),
                    TextSpan(text: ' and '),
                    TextSpan(text: 'd', style: TextStyle(color:Colors.pink)),
                    TextSpan(text: ' and store these in the right variables.'),
                  ]
              ),
            ),
            SizedBox(height: 40),
            Flexible(
              child: ListView(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                children: [
                  // SizedBox(height: 200),
                  // Text('Actual question with blanks etc'),
                  SizedBox(height: 10),
                  Text(
                    'int a = 4;',
                    style: TextStyle( color:Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'int b = 29;',
                    style: TextStyle( color:Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'double c = 6.7;',
                    style: TextStyle( color:Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'double d = -2.34;',
                    style: TextStyle( color:Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                      direction: Axis.horizontal,
                      spacing: 6,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            'int min1 = Math.min(',
                            style: TextStyle( color:Colors.black, fontSize: 18),
                          ),
                        ),
                        BlankConstruct(blanks[0]),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            ',',
                            style: TextStyle( color:Colors.black, fontSize: 18),
                          ),
                        ),
                        BlankConstruct(blanks[1]),
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            ');',
                            style: TextStyle( color:Colors.black, fontSize: 18),
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 10),
                  Wrap(
                      direction: Axis.horizontal,
                      spacing: 6,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'double min2 = Math.min(',
                            style: TextStyle( color:Colors.black, fontSize: 15),
                          ),
                        ),
                        BlankConstruct(blanks[2]),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            ',',
                            style: TextStyle( color:Colors.black, fontSize: 15),
                          ),
                        ),
                        BlankConstruct(blanks[3]),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            ');',
                            style: TextStyle( color:Colors.black, fontSize: 15),
                          ),
                        ),
                      ]
                  ),
                  SizedBox(height: 10),
                  Text(
                    'System.out.println("min1= "+min1+" & min2= "+min2);',
                    style: TextStyle( color:Colors.black, fontSize: 15),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choices:',
                          style: TextStyle(
                            fontFamily: 'FreeSans',
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: RaisedButton(
                              color: Colors.redAccent,
                              textColor: Colors.white,
                              padding: EdgeInsets.all(0),
                              onPressed:(){
                                currentblank=0;
                                for(int i=0;i<blanks.length;i++){
                                  blanks[i][1]=0;
                                  blanks[i][2]=-1;
                                }
                                for(int i=0;i<options.length;i++){
                                  options[i][1]=0;
                                }
                                setState(() {

                                });
                              },
                              child: Text(
                                'RESET',
                                style: TextStyle(
                                    fontSize: 12
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 6,
                        children: options.map((thisoption){
                          if(thisoption[1]==1){
                            // if it has been selected
                            // return Container();
                            return SizedBox(height: 30,width: 90,);
                            // return RaisedButton(
                            //   onPressed: null,
                            //   child: Text(
                            //       thisoption[0]
                            //   ),
                            // );
                          }
                          else{
                            return RaisedButton(
                              onPressed: (){
                                if(currentblank < blanks.length){
                                  blanks[currentblank][1]=1;
                                  blanks[currentblank][2]=options.indexOf(thisoption);
                                  // var _prevblank=currentblank;
                                  currentblank+=1;
                                  bool _blankFoundAhead=false;
                                  for(int i=currentblank;i<blanks.length;i++){
                                    if(blanks[i][2]==-1){
                                      currentblank=i;
                                      _blankFoundAhead=true;
                                      break;
                                    }
                                  }
                                  if(_blankFoundAhead==false) {
                                    for (var i = 0; i < currentblank; i++) {
                                      if (blanks[i][1] == 0) {
                                        currentblank = i;
                                        break;
                                      }
                                    }
                                  }

                                  options[options.indexOf(thisoption)][1]=1; //this option has been selected

                                  bool _allFlagsFilled=true;
                                  for(int i=0;i<blanks.length;i++){
                                    if(blanks[i][2]==-1){
                                      _allFlagsFilled=false;
                                      break;
                                    }
                                  }
                                  if(_allFlagsFilled==true)
                                    allBlanksFilled=true;
                                  // if(currentblank==_prevblank)
                                  //   allBlanksFilled=true;

                                  setState(() {

                                  });
                                }
                              },
                              child: Text(
                                  thisoption[0]
                              ),
                            );
                          }

                        }).toList(),
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: (MediaQuery. of(context). size. width-60)/2,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JavaMathQuestion9Theory()),
                      );
                    },
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text(
                      'Check Theory',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'FreeSans'
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(
                  height: 50,
                  width: (MediaQuery. of(context). size. width-60)/2,
                  child: RaisedButton(
                    onPressed: (allBlanksFilled==false)?null:() async {
                      var _isCorrect = true;
                      for(var i=0; i<blanks.length;i++){
                        if(blanks[i][0]!=blanks[i][2]){
                          _isCorrect=false;
                          break;
                        }
                      }

                      ///////////////////////////////////////////////////////////////////
                      // code for multiple blanks starts here
                      //copying blanks[x][2] into blanks2,blanks3 and blanks4
                      for(var i=0; i<blanks.length;i++){
                        blanks2[i][2]=blanks[i][2];
                        blanks3[i][2]=blanks[i][2];
                        blanks4[i][2]=blanks[i][2];
                      }
                      var _isCorrect2 = true;
                      for(var i=0; i<blanks2.length;i++){
                        if(blanks2[i][0]!=blanks2[i][2]){
                          _isCorrect2=false;
                          break;
                        }
                      }
                      var _isCorrect3 = true;
                      for(var i=0; i<blanks3.length;i++){
                        if(blanks3[i][0]!=blanks3[i][2]){
                          _isCorrect3=false;
                          break;
                        }
                      }
                      var _isCorrect4 = true;
                      for(var i=0; i<blanks4.length;i++){
                        if(blanks4[i][0]!=blanks4[i][2]){
                          _isCorrect4=false;
                          break;
                        }
                      }
                      ///////////////////////////////////////////////////////////////////

                      if(_isCorrect==true || _isCorrect2==true || _isCorrect3==true || _isCorrect4==true){
                        print("Correct Answer");

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        var completed_jm_questions=[];
                        if(prefs.getString("completed_jm_questions")!=null) {
                          print("notnull");
                          completed_jm_questions = jsonDecode(prefs.getString("completed_jm_questions"));
                        }
                        int index = completed_jm_questions.indexOf(uniqueID);
                        print(index);
                        if(index<0){
                          completed_jm_questions.add(uniqueID);
                          _isAlreadySubmitted = false;
                        }
                        prefs.setString("completed_jm_questions", jsonEncode(completed_jm_questions));
                        print(jsonDecode(prefs.getString("completed_jm_questions")));
                        _controllerCenter.play();

                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Column(
                              children: [
                                Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 70,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: ConfettiWidget(
                                        confettiController: _controllerCenter,
                                        blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
                                        shouldLoop: false, // start again as soon as the animation is finished
                                        colors: const [
                                          Colors.green,
                                          Colors.blue,
                                          Colors.pink,
                                          Colors.orange,
                                          Colors.purple
                                        ], // manually specify the co// define a custom shape/path.
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Correct Answer",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            content: Wrap(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Output: min1= 4 & min2= -2.34",
                                      ),
                                    ],
                                  ),
                                  (_isAlreadySubmitted==false)?
                                  (GlobalVariables.rank==15)?Wrap():RankUpWidget(incpoints: 25,):Wrap(),
                                ]
                            ),
                            // contentPadding: EdgeInsets.only(bottom: 0, left: 20, top: 10, right: 20),
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                            // content: Text("You have raised a Alert Dialog Box"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  // Navigator.of(ctx).pop();
                                  Navigator.pop(ctx, "jmq10");
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => BasicQuestion3()),
                                  // );
                                },
                                child: Text("Continue"),
                              ),
                            ],
                          ),
                        );
                      }
                      else{
                        print("Wrong Answer");
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Column(
                              children: [
                                Icon(
                                  Icons.cancel,
                                  color: Colors.red[400],
                                  size: 70,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Wrong Answer",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                            content: Text("Try 'Check Theory' to get hints."),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text("Retry"),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 15,),
                        Text(
                          'RUN',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'FreeSans'
                          ),
                        ),
                        Icon(
                            Icons.play_arrow
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
