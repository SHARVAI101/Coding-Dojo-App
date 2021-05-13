import 'package:flutter/material.dart';

class JavaMathQuestion1Theory extends StatefulWidget {
  @override
  _JavaMathQuestion1TheoryState createState() => _JavaMathQuestion1TheoryState();
}

class _JavaMathQuestion1TheoryState extends State<JavaMathQuestion1Theory> {
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
                "Basic Java Math",
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
              RichText(
                text: new TextSpan(
                  style: new TextStyle(
                    fontFamily: 'FreeSans',
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(text: 'Just like in normal math, Java follows the ', style: new TextStyle(color: Colors.grey[700], fontSize: 15,),),
                    new TextSpan(text: 'BODMAS', style: new TextStyle(color: Colors.pink, fontSize: 15,),),
                    new TextSpan(text: ' rules which stands for Brackets Off Divison Multiplication Addition and Subtraction.', style: new TextStyle(color: Colors.grey[700], fontSize: 15,),),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "So, Brackets are solved first, Division and Multiplication second (whichever comes first is solved first), and lastly, Addition and Subtraction (whichever comes first is solved first).",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "To add variables, we do, a + b;\nTo subtract variables, we do, a - b;\nTo divide variables, we do, a / b;\nTo multiply variables, we do, a * b;",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "To write the equation a²+b²+2ab, we write,",
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
                              new TextSpan(text: 'int sum = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: 'a*a + b*b + 2*a*b', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ';', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text(
                "To find the simple interest, we can write,",
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
                              new TextSpan(text: 'float si = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '( p*n*r ) / 100', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ';', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height:20),
            ],
          ),
        ),
      ),
    );
  }
}
