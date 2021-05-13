import 'dart:async';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/rankuppage.dart';
import 'package:coding_dojo_app/solutionpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/tutorial.dart';

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

  bool _isStartEnabled = true;
  bool _isStopEnabled = false;
  bool _isSubmitEnabled = false;
  bool _isResetEnabled = false;

  bool _isSubmitted = false;

  String timetakenifsolved="~";

  // tutorial items
  var playkey = GlobalKey();
  var stopkey = GlobalKey();
  var questionkey = GlobalKey();
  var submitkey = GlobalKey();
  List<TutorialItens> itens = [];

  @override
  void initState() {
    super.initState();
    //print(widget.q_id);

    if(GlobalVariables.questionslist[widget.q_id][5]==1){
      setState(() {
        _isSubmitted = true;

        //converting time taken to hours:mins:sec format
        //print(int.parse(double.parse(GlobalVariables.questionslist[widget.q_id][6].toString()).round().toString()));
        int x=int.parse(double.parse(GlobalVariables.questionslist[widget.q_id][6].toString()).round().toString());//list chya double time la string madhe karun double madhe karun round karun string karun int kela bc
        //int x=9464;
        int hours=(x/3600).floor();
        int mins=(x/60).floor()-(hours * 60);
        int sec=x%60;
        timetakenifsolved=hours.toString().padLeft(2,"0")+" : "
            + mins.toString().padLeft(2,"0")+" : "
            + sec.toString().padLeft(2,"0");
      });
    }
    else{
      // new Timer(new Duration(milliseconds: 200), ()
      // {
      //   _showAlert(context);
      // });

      itens.addAll({
        TutorialItens(
            globalKey: questionkey,
            touchScreen: true,
            top: 450,
            left: 40,
            children: [
              Text(
                "This is the question.",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 100,
              )
            ],
            widgetNext: Text(
              "Tap to continue",
              style: GoogleFonts.montserrat(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            shapeFocus: ShapeFocus.square),
        TutorialItens(
          globalKey: playkey,
          touchScreen: true,
          top: 200,
          left: 40,
          children: [
            Text(
              "Press the play button to start the timer and start solving the question on your PC/Laptop",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 100,
            )
          ],
          widgetNext: Text(
            "Tap to continue",
            style: GoogleFonts.montserrat(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.oval,
        ),
        TutorialItens(
          globalKey: stopkey,
          touchScreen: true,
          top: 200,
          // bottom: 60,
          left: 40,
          children: [
            Text(
              "Once you have completed writing the code and if it runs, press stop.",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            )
          ],
          widgetNext: Text(
            "Tap to continue",
            style: TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.oval,
        ),
        TutorialItens(
          globalKey: submitkey,
          touchScreen: true,
          top: 200,
          // bottom: 50,
          left: 40,
          children: [
            Text(
              "Once done, press FINISH to complete. This will rank you up.",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            )
          ],
          widgetNext: Text(
            "Finish tutorial",
            style: GoogleFonts.montserrat(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.square,
        ),
      });
      Future.delayed(Duration(microseconds: 200)).then((value) {
        // Tutorial.showTutorial(context, itens);
        checkTutorialSeen();
      });

      // Tutorial.showTutorial(context, itens);
    }
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

  Future<void> checkTutorialSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _onSeen = (prefs.getBool('tutorialSeen') ?? false);
    print("tutorial seen="+_onSeen.toString());
    if (_onSeen==false) {
      // Tutorial.showTutorial(context, itens); //testing keeping this off and instead, showing a dialog
      _showRememberDialog();
      await prefs.setBool('tutorialSeen', true);
    }
  }

  _showRememberDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Color(0xFF3498db),
        title: Text(
          "REMEMBER",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 30
          ),
        ),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        // contentPadding: EdgeInsets.only(top: 0,left:20,right:20,bottom:10),
        content: Wrap(
          // scrollDirection: Axis.vertical,
          // direction: Axis.vertical,
          children: [
            Image.asset(
              'assets/images/laptop_illustration.png',
              fit: BoxFit.cover,
            ),
            Text(
              "Use your laptop / PC to write this code!",
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 18
              ),
            ),
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
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
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
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
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
                              GlobalVariables.questionslist[widget.q_id][2],
                              key: questionkey,
                              style: TextStyle(
                                fontFamily: "FreeSans",
                                  color: Colors.grey[800],
                                  fontSize: 20,
                                  // letterSpacing: 0.5,

                              )
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
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // height: 80,
                      width: 150,
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 13.0,
                        //     color: Colors.black.withOpacity(.5),
                        //     offset: Offset(6.0, 7.0),
                        //   ),
                        // ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'COMPLETION STATUS',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(height: 13),
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
                            SizedBox(height: 3),
                          ],
                        ),
                      ),

                    ),
                    SizedBox(width: 20),
                    (_isSubmitted==false)?Container():Container(
                      // height: 80,
                      width: 150,
                      padding: EdgeInsets.only(left: 10, right: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]),
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius:13.0,
                        //     color: Colors.black.withOpacity(.5),
                        //     offset: Offset(6.0, 7.0),
                        //   ),
                        // ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                              timetakenifsolved,
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
          _isSubmitted ? Container()
              :
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 13.0,
                    color: Colors.black.withOpacity(.5),
                    offset: Offset(6.0, 7.0),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  Text(
                    "TIME YOURSELF",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 10,),
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
                          key: playkey,
                          iconSize: 45,
                          icon: Image.asset(
                            _isStartEnabled ? 'assets/icons/play.png' : 'assets/icons/play_disabled.png',
                            height: 60,
                            width: 60,
                          ),
                          onPressed: _isStartEnabled ? (){
                            print("hi");
                            swatch.start();
                            startTimer();
                            setState(() {
                              _isStopEnabled = true;
                              _isStartEnabled = false;
                              _isResetEnabled = false;
                              _isSubmitEnabled = false;
                            });
                          } : null,
                        ),
                        SizedBox(width: 15,),
                        IconButton(
                          key: stopkey,
                          iconSize: 45,
                          icon: Image.asset(
                            _isStopEnabled ? 'assets/icons/stop.png' : 'assets/icons/stop_disabled.png',
                            height: 60,
                            width: 60,
                          ),
                          onPressed: _isStopEnabled ? (){
                            print("stophi");
                            swatch.stop();
                            setState(() {
                              _isStopEnabled = false;
                              _isStartEnabled = true;
                              _isSubmitEnabled = true;
                              _isResetEnabled = true;
                            });
                          } : null,
                        ),
                        SizedBox(width: 15,),
                        IconButton(
                          iconSize: 45,
                          icon: Image.asset(
                            _isResetEnabled ? 'assets/icons/replay.png' : 'assets/icons/replay_disabled.png',
                            height: 60,
                            width: 60,
                          ),
                          onPressed: (){
                            print("rehi");
                            swatch.reset();
                            setState(() {
                              timetodisplay="00 : 00 : 00";
                              secondstaken=0.0;
                              _isStartEnabled = true;
                              _isStopEnabled = false;
                              _isSubmitEnabled = false;
                              _isResetEnabled = false;
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
                      key: submitkey,
                      onPressed: _isSubmitEnabled ? (){
                        print("rank -> "+GlobalVariables.rank.toString());
                        print("old rank-> "+GlobalVariables.oldrank.toString());
                        GlobalVariables.oldrank=GlobalVariables.rank;

                        //print(GlobalVariables.questionslist[widget.q_id][3]);
                        if(GlobalVariables.questionslist[widget.q_id][3]=='EASY')
                          GlobalVariables.points+=25;
                        else if(GlobalVariables.questionslist[widget.q_id][3]=='MODERATE')
                          GlobalVariables.points+=50;
                        else if(GlobalVariables.questionslist[widget.q_id][3]=='ADVANCED')
                          GlobalVariables.points+=75;
                        else if(GlobalVariables.questionslist[widget.q_id][3]=='VERY ADVANCED')
                          GlobalVariables.points+=100;
                        else if(GlobalVariables.questionslist[widget.q_id][3]=='LEGENDARY')
                          GlobalVariables.points+=125;

                        if(GlobalVariables.points>GlobalVariables.rankslist[GlobalVariables.rank][4]){
                          GlobalVariables.rank+=1;
                        }
                        print("new points -> "+GlobalVariables.points.toString());
                        print("new rank -> "+GlobalVariables.rank.toString());

                        Future<void> setprefs()async{
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setInt('points', GlobalVariables.points);
                          await prefs.setInt('rank', GlobalVariables.rank);

                          List<int> completion_status = List.filled(GlobalVariables.questionslist.length, 0);
                          for(int i = 0; i < GlobalVariables.questionslist.length; i++){
                            completion_status[i]=GlobalVariables.questionslist[i][5];
                          }
                          List<String> completion_status_string=  completion_status.map((i)=>i.toString()).toList();
                          await prefs.setStringList('completion_status', completion_status_string);

                          List<double> timetakenlist = List.filled(GlobalVariables.questionslist.length, 0.0);
                          for(int i = 0; i < GlobalVariables.questionslist.length; i++){
                            timetakenlist[i]=GlobalVariables.questionslist[i][6];
                          }
                          List<String> timetakenlist_string=  timetakenlist.map((i)=>i.toString()).toList();
                          await prefs.setStringList('timetakenlist', timetakenlist_string);
                        }
                        setprefs();

                        setState(() {
                          GlobalVariables.questionslist[widget.q_id][5]=1;
                          GlobalVariables.questionslist[widget.q_id][6]=secondstaken-1;
                          _isSubmitted=true;

                          //setting time taken to hrs:mins:Sec
                          int x=int.parse(double.parse(GlobalVariables.questionslist[widget.q_id][6].toString()).round().toString());//list chya double time la string madhe karun double madhe karun round karun string karun int kela bc
                          //int x=9464;
                          int hours=(x/3600).floor();
                          int mins=(x/60).floor()-(hours * 60);
                          int sec=x%60;
                          timetakenifsolved=hours.toString().padLeft(2,"0")+" : "
                              + mins.toString().padLeft(2,"0")+" : "
                              + sec.toString().padLeft(2,"0");
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RankUp()),
                        );
                      } : (){},
                      child: Text(
                          'FINISH',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),

                      ),
                      color: _isSubmitEnabled ? Colors.green : Color(0xFFD8D8D8),
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
          SizedBox(height:20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: SizedBox(
              height: 60,
              child: RaisedButton(
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Solution(q_id: widget.q_id)),
                  );
                },
                color:  Color(0xFFE62A6E),
                textColor: Colors.white,
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/solution.png',
                      height: 22,
                      width: 22,
                    ),
                    SizedBox(width:5),
                    Text(
                      'View Solution',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 100)
        ],
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Solution(q_id: widget.q_id)),
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
      ),*/
    );
  }
  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icons/important_note.png',
                height: 29,
                width: 29,
              ),
              SizedBox(width: 10,),
              Text("Important Note!"),
            ],

          ),
          content: Text("Please solve this question on your own PC/Laptop and time yourself with the timer provided."),
            actions: <Widget>[
              FlatButton(
                child: Text("Ok"),
                onPressed: () {
                Navigator.of(context).pop();
                },
              ),
            ]
        )
    );
  }
}
