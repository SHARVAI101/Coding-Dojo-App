import 'package:flutter/material.dart';

class LoopsQuestion1Theory extends StatefulWidget {
  @override
  _LoopsQuestion1TheoryState createState() => _LoopsQuestion1TheoryState();
}

class _LoopsQuestion1TheoryState extends State<LoopsQuestion1Theory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,35.0,20.0,20.0),
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Text(
                "Running For-Loops",
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
                "When you need to run a group of lines of code again and again, it would be dumb to just write them again and again. Instead, we use something called a loop. ",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "There are many types of loops eg., for-loop, while-loop, do-while loop, etc.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "A for-loop looks as follows:",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
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
                        Text(
                          "for(initialization condition; termination condition; increment/decrement)\n{\n        // code lines that need to be\n            repeatedly executed\n}",
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text(
                'Example :',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 15,),
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
                              new TextSpan(text: '// Declaring a for-loop that starts at 0 and runs upto 5 and the i variable increments once every time.\n\n', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
                              new TextSpan(text: 'for  ', style: new TextStyle(color: Color(0xff006699), fontSize: 16,),),
                              new TextSpan(text: '(int  i = 1 ; i <= 5 ; i++)\n{\n       //code to be repeated\n}', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
