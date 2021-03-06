import 'package:flutter/material.dart';

class JavaMathQuestion9Theory extends StatefulWidget {
  @override
  _JavaMathQuestion9TheoryState createState() => _JavaMathQuestion9TheoryState();
}

class _JavaMathQuestion9TheoryState extends State<JavaMathQuestion9Theory> {
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
                "Minimum Number",
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
                "The second math function that we'll learn is the Min math function which is written as follows:",
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
                              new TextSpan(text: 'Math.min()', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Math.min() finds the minimum of two numbers\nExample,",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 5,),
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
                              new TextSpan(text: 'int minimum = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: 'Math.min(', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: 'a, b', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ')', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: ';', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "OR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 5,),
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
                              new TextSpan(text: 'int minimum = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: 'Math.min(', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: 'b, a', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ')', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: ';', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "Where a and b are the two numbers whose minimum is to be found. The order of a and b can be anything.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Remember, Math.min gives an output value whose data type depends on the 2 input numbers.\nExample,",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 5,),
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
                              new TextSpan(text: 'int min = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: 'Math.min(', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: '4, 6', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ')', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: ';\n', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '// this output is int because 4 and 6 are int', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
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
                              new TextSpan(text: 'double min = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: 'Math.min(', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: '2.5, 6.8', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ')', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: ';\n', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '// this output is double because 2.5 and 6.8 are double', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
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
