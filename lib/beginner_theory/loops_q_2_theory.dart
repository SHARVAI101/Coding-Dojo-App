import 'package:flutter/material.dart';

class LoopsQuestion2Theory extends StatefulWidget {
  @override
  _LoopsQuestion2TheoryState createState() => _LoopsQuestion2TheoryState();
}

class _LoopsQuestion2TheoryState extends State<LoopsQuestion2Theory> {
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
                "Stopping Loops",
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
                "Sometimes, a loop needs to be stopped even before its termination condition is achieved. In such a case, the loop needs to be terminated at a completely new condition. ",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Example :",
                style: TextStyle(
                  fontFamily: 'FreeSans',
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
                              new TextSpan(text: 'for  ', style: new TextStyle(color: Color(0xff006699), fontSize: 16,),),
                              new TextSpan(text: '(int  i = 1 ; i <= 100 ; i++)\n{\n       // some code\n}\n\n', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '// This loop runs for a 100 times. If say for some reason, we want to stop its execution when i is 75, we can use something called a "break statement" in the following manner: \n\n', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
                              new TextSpan(text: 'for  ', style: new TextStyle(color: Color(0xff006699), fontSize: 16,),),
                              new TextSpan(text: '(int  i = 1 ; i <= 100 ; i++)\n{\n', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '      if', style: new TextStyle(color: Color(0xff006699), fontSize: 16,),),
                              new TextSpan(text: '  (i == 75)\n     {\n', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '            break', style: new TextStyle(color: Color(0xff006699), fontSize: 16,),),
                              new TextSpan(text: ' ;\n      }\n}\n\n', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '// The for loop will now stop execution immediately.', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
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
