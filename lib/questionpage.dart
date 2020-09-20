import 'dart:async';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/rankuppage.dart';
import 'package:coding_dojo_app/solutionpage.dart';
import 'package:flutter/material.dart';



class QuestionDedicated extends StatefulWidget {
  int q_id;
  QuestionDedicated({Key key, this.q_id}): super(key: key);
  @override
  _QuestionDedicatedState createState() => _QuestionDedicatedState();
}

class _QuestionDedicatedState extends State<QuestionDedicated> {

  var swatch=Stopwatch();
  String timetodisplay="00 : 00 : 00";
  final dur=const Duration(seconds: 1);
  double secondstaken=0.0;

  void startTimer(){
    print("startTimer");
    Timer(dur, keeprunning);
  }

  void keeprunning(){
    if(swatch.isRunning){
      print("isRunning");
      startTimer();
    }

    if(this.mounted){
      setState((){
        secondstaken+=1;
        print("secondstaken="+secondstaken.toString());
        timetodisplay=swatch.elapsed.inHours.toString().padLeft(2,"0")+" : "
            + (swatch.elapsed.inMinutes%60).toString().padLeft(2,"0")+" : "
            + (swatch.elapsed.inSeconds%60).toString().padLeft(2,"0");
      });
    }

  }

  @override
  void initState() {
    super.initState();
    print(widget.q_id);

    /*if(GlobalVariables.questionslist[widget.q_id][5]==1){
      //if question is completed
      double sec=GlobalVariables.questionslist[widget.q_id][6];
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      int mins=(sec%60).toInt();
      String minutes=twoDigits(mins);
      int hrs=(sec%60).toInt();
      String hours=twoDigits(hrs);
      String seconds=twoDigits(sec.toInt());
    }*/

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          GlobalVariables.questionslist[widget.q_id][1],
          style: TextStyle(
            color: Colors.grey[200],
          ),
        ),
        backgroundColor: Color(0xFF18214C),
        actions: <Widget>[

        ],
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey[200],
            size: 20,
          ),
        ),
      ),
      body:ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          /*Image.asset(
                            'assets/icons/question.png',
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 15),*/
                          Expanded(
                            child: Text(
                              "Question : "+GlobalVariables.questionslist[widget.q_id][2],
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 22,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (GlobalVariables.questionslist[widget.q_id][4] != "null")? Image.asset(
                      GlobalVariables.questionslist[widget.q_id][4],
                      width: 200,
                    ):Container()
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: 150,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 13.0,
                            color: Colors.black.withOpacity(.5),
                            offset: Offset(6.0, 7.0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'COMPLETION STATUS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 16),
                            (GlobalVariables.questionslist[widget.q_id][5] == 1)?
                            Image.asset(
                              'assets/icons/tick_1.png',
                              width: 30,
                              height: 30,
                            ):Image.asset(
                              'assets/icons/incomplete.png',
                              width: 30,
                              height: 30,
                            ),
                          ],
                        ),
                      ),

                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 80,
                      width: 150,
                      padding: EdgeInsets.only(left: 10, right: 20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 13.0,
                            color: Colors.black.withOpacity(.5),
                            offset: Offset(6.0, 7.0),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'TIME TAKEN',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '(hrs : mins : secs)',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 11,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              //'00 : 00 : 00',
                              GlobalVariables.questionslist[widget.q_id][6].toString(),
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              Text(
                timetodisplay,
                style: TextStyle(
                  fontSize: 52,
                  color: Color(0xFF18214C),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      iconSize: 45,
                      icon: Image.asset(
                        'assets/icons/play.png',
                        height: 60,
                        width: 60,
                      ),
                      onPressed: (){
                        print("hi");
                        swatch.start();
                        startTimer();
                      },
                    ),
                    SizedBox(width: 15,),
                    IconButton(
                      iconSize: 45,
                      icon: Image.asset(
                        'assets/icons/stop.png',
                        height: 60,
                        width: 60,
                      ),
                      onPressed: (){
                        print("stophi");
                        swatch.stop();
                      },
                    ),
                    SizedBox(width: 15,),
                    IconButton(
                      iconSize: 45,
                      icon: Image.asset(
                        'assets/icons/replay.png',
                        height: 60,
                        width: 60,
                      ),
                      onPressed: (){
                        print("rehi");
                        swatch.reset();
                        setState(() {
                          timetodisplay="00 : 00 : 00";
                          secondstaken=0.0;
                        });

                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: 130,
                child: FlatButton(
                  onPressed: (){
                    print("rank -> "+GlobalVariables.rank.toString());
                    print("old rank-> "+GlobalVariables.oldrank.toString());
                    GlobalVariables.oldrank=GlobalVariables.rank;
                    GlobalVariables.points+=25;
                    if(GlobalVariables.points>GlobalVariables.rankslist[GlobalVariables.rank][4]){
                      GlobalVariables.rank+=1;
                    }
                    print("new points -> "+GlobalVariables.points.toString());
                    print("new rank -> "+GlobalVariables.rank.toString());

                    setState(() {
                      GlobalVariables.questionslist[widget.q_id][5]=1;
                      GlobalVariables.questionslist[widget.q_id][6]=secondstaken-1;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RankUp()),
                    );
                  },
                  child: Text(''
                      'Submit',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),

                  ),
                  color: Colors.green,
                ),
              ),
              SizedBox(height:20),
              Text(
                "The solution given doesnot handle every single error case that is for you to figure out. Here, we only present essential functionality.",

              ),
              SizedBox(height: 100,)
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Solution()),
          );
        },
        label: Text(
          'View Solution',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        icon: Image.asset(
          'assets/icons/solution.png',
          height: 22,
          width: 22,
        ),
        //backgroundColor: Colors.green,
        backgroundColor: Color(0xFFE62A6E),
      ),
    );
  }
}
