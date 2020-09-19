import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/models/question_model.dart';
import 'package:coding_dojo_app/questionchart.dart';
import 'package:coding_dojo_app/questionpage.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  String chap_name;
  QuestionPage({Key key, this.chap_name}): super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
   var qlist=[];

  @override
  void initState() {
    super.initState();

    int k=0;
    for(int i=0;i< GlobalVariables.questionslist.length;i++){
      if(GlobalVariables.questionslist[i][0]==widget.chap_name){
        print("gblv before-"+GlobalVariables.questionslist[i].toString());
        qlist.add(GlobalVariables.questionslist[i]);
        qlist[k].add(i);
        print("gblv-"+GlobalVariables.questionslist[i].toString());
        print(qlist);
        k++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.chap_name,
          style: TextStyle(
            color: Colors.grey[200],
          ),
        ),
//          backgroundColor: Color(0xFFE62A6E),
        backgroundColor: Color(0xFF18214C),
        elevation: 50.0,
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
            child: LineChartSample2(chap_name: widget.chap_name,),
          ),
          // SizedBox(height: 8),
          Container(
            height: MediaQuery.of(context).size.height-308,
            color: Color(0xFFEFF0F4),
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: qlist.map((i){
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => QuestionDedicated(q_id: i[7])),
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
                                      i[1],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    SizedBox(height: 6),
                                    Text(
                                      'Difficulty: '+i[3],
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
                                          i[6].toString(),
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
                                child: ( i[5] == 1 ) ? Image.asset(
                                  'assets/icons/tick_1.png',
                                  width: 30,
                                  height: 30,
                                ):Image.asset(
                                  'assets/icons/incomplete.png',
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );

                  }).toList(),
              ),
            ),
          ),
        ],
      ),

    );
  }
}