import 'package:coding_dojo_app/allrankspage.dart';
import 'package:coding_dojo_app/chapterpage.dart';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/models/chapter_model.dart';
import 'package:coding_dojo_app/rankuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _percent=0.0;
  String _percentString="0%";

  @override
  void initState() {
    super.initState();

    int _questionsCompleted = 0;
    int _total_questions = GlobalVariables.questionslist.length;
    for(int i=0; i < GlobalVariables.questionslist.length; i++)
    {
      if (GlobalVariables.questionslist[i][5] == 1)
      {
        _total_questions++;
      }
    }
    print(_total_questions);
    setState(() {
      _percent = (_questionsCompleted / _total_questions);
      _percent=double.parse(_percent.toStringAsFixed(2));
      print(_percent);
      _percentString=(_percent*100).toInt().toString()+"%";
      print(_percentString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 60,
        title: Align(
          alignment: Alignment.bottomCenter,
          child: Text('THE CODING DOJO',
            style: GoogleFonts.overpass
              (
              textStyle: TextStyle(
                fontSize: 30,
                color: Color(0xFFEFF0F4),
              )
            ),
            /*style: TextStyle(
              fontSize: 30,
              color: Color(0xFFEFF0F4),
            ),*/
          ),
        ),
//          backgroundColor: Color(0xFFE62A6E),
//            backgroundColor: Colors.white,
        backgroundColor: Color(0xFF18214C),
        elevation: 0.0,
        /*leading: Icon(
          Icons.dehaze,
          color: Color(0xFFEFF0F4),
        ),*/
      ),
      body: Column(
          children: <Widget>[
            Container(
              color: Color(0xFF18214C),
              height: 205.0,
              width: 360.0,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(35, 25.0, 35, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          new Container(
                            width: 110.0,
                            height: 110.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(new Radius.circular(65.0)),
                              border: new Border.all(
                                color:  Color(0xFFEFF0F4),
                                width: 4.0,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                GlobalVariables.rankslist[GlobalVariables.rank][2],
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width:110,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      GlobalVariables.rankslist[GlobalVariables.rank][0],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        //fontWeight: FontWeight.bold,
                                        color: Color(0xFFEFF0F4),
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: VerticalDivider(
                          color: Color(0xFFEFF0F4),
                          thickness: 2,
                          width: 30,
                          indent: 20,
                          endIndent: 60,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Container(
                          child: CircularPercentIndicator(
                            radius: 105.0,
                            lineWidth: 8.0,
                            animation: true,
                            percent: _percent,
                            center: new Text(
                              _percentString,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Color(0xFFEFF0F4),
                              ),
                            ),
                            footer: new Text(
                              "PROGRESS",
                              style: new TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color(0xFFEFF0F4),
                                letterSpacing: 1,
                              ),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Color(0xFFE62A6E),
                            backgroundColor: Color(0xFFEFF0F4),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Container(
              color: Color(0xFFEFF0F4),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 25, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'CHAPTERS',
                        style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    //SizedBox(width: 110),
                    SizedBox(
                      height: 35,
                      width: 115,
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AllRanks()),
                          );
                        },
                        child: Text(''
                            'View Ranks',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        ),
                        color: Color(0xFF18214C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //SizedBox(height: 10),
            Container(
              color: Color(0xFFEFF0F4),
              height: MediaQuery.of(context).size.height-357,
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20,),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: chapters.length,
                    itemBuilder: (BuildContext context, int index) {
                      Chapter chapter = chapters[index];
                      return Padding(
                        padding: const EdgeInsets.only( bottom: 20),
                        child: Column(
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => QuestionPage()),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),

                              ),

                              //color: Color(0xFFE62A6E),
                              //textColor: Colors.white,
                              color:  Colors.white,
                              textColor: Colors.black54,
                              padding: EdgeInsets.fromLTRB(10.0, 18.0, 18.0, 18.0),
                              splashColor: Color(0xFF18214C),

                              child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 75.0,
                                    height: 75.0,
                                    decoration: new BoxDecoration(
                                      color: Color(0xFF18214C),
                                      borderRadius: new BorderRadius.all(new Radius.circular(65.0)),
                                      border: new Border.all(
                                        color:  Colors.white,
                                        width: 4.0,
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        chapter.chapter_icon,
                                        height: 22,
                                        width: 22,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:215,

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                chapter.chaptername,
                                                style: TextStyle(
                                                  fontSize: 19.0,
                                                  letterSpacing: 0.5,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                '5 Questions',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          //color: Color(0xFFE62A6E),
                                          color: Colors.green,
                                          size: 28,
                                        ),
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            ),
                            //SizedBox(height: 10),
                          ],
                        ),
                      );
                    }
                ),
              ),
            ),
          ]),
    );
  }
}
