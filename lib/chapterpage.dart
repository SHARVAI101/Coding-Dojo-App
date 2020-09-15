import 'package:coding_dojo_app/models/question_model.dart';
import 'package:coding_dojo_app/questionchart.dart';
import 'package:coding_dojo_app/questionpage.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QUESTIONS',
          style: TextStyle(
            color: Colors.grey[200],
          ),
        ),
//          backgroundColor: Color(0xFFE62A6E),
        backgroundColor: Color(0xFF18214C),
        elevation: 0.0,
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

      body: Column(
        children: <Widget>[
          Container(
//              height: 200.0,
//              width: 350.0,
            //color: Colors.black,
            child: LineChartSample2(),
          ),
          // SizedBox(height: 8),
          Container(
            height: MediaQuery.of(context).size.height-308,
            color: Color(0xFFEFF0F4),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: questions.length,
                itemBuilder: (BuildContext context, int index) {
                  Question question = questions[index];
                  return Padding(
                    padding: EdgeInsets.only(left: 15, top: 20, right: 15),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => QuestionDedicated()),
                        );
                      },
                      textColor: Color(0xFF18214C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                      splashColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    question.questiontitle,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    'Difficulty: '+question.questiondifficulty,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.access_time,
                                        size: 15,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 6),
                                      Text(
                                        '02 : 08',
                                        style:
                                        TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      )
                                    ],
                                  ),

                                ]
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Image.asset(
                                'assets/icons/tick_1.png',
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),

    );
  }
}