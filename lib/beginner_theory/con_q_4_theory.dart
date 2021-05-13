import 'package:flutter/material.dart';

class ConditionsQuestion4Theory extends StatefulWidget {
  @override
  _ConditionsQuestion4TheoryState createState() => _ConditionsQuestion4TheoryState();
}

class _ConditionsQuestion4TheoryState extends State<ConditionsQuestion4Theory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,30.0,20.0,0.0),
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Text(
                "If-else",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 30,
                ),
              ),
//              SizedBox(height: 15,),
//              Text(
//                "Theory:",
//                style: TextStyle(
//                  fontFamily: 'FreeSans',
//                  fontSize: 20,
//                ),
//              ),
              SizedBox(height: 15,),
              Text(
                "Sometimes, we want the program to be such that if the if condition isn't true, we want to execute a different set of statements. This is where the else block comes in.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Example,",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 5),
              Opacity(
                opacity: 0.8,
                child: Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: 'if ( condition )', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '\n{', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '\n\t\t\t\t\t\t// do process 1', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '\n}', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '\nelse', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '\n{', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '\n\t\t\t\t\t\t// do process 2', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '\n}', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Text(
                "if the condition is true, the if block will be run (i.e., process 1 will be run)\nbut, if the condition is false, the else block will be run (i.e., process 2 will be run)",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

