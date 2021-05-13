import 'package:flutter/material.dart';

class BasicQuestion1point51Theory extends StatefulWidget {
  @override
  _BasicQuestion1point51TheoryState createState() => _BasicQuestion1point51TheoryState();
}

class _BasicQuestion1point51TheoryState extends State<BasicQuestion1point51Theory> {
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
                "Printing Variables",
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
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(text: 'Values of variables can be printed using the ', style: new TextStyle(color: Colors.grey[700], fontSize: 15,),),
                    new TextSpan(text: 'System.out.println()', style: new TextStyle(color: Colors.pink, fontSize: 15,),),
                    new TextSpan(text: ' function. There are multiple ways to do this.', style: new TextStyle(color: Colors.grey[700], fontSize: 15,),),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Suppose you have a variable named mango, then it can be printed in the following ways:",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "int mango = 579;",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Method 1: Directly printing the variable",
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
                              new TextSpan(text: 'System.out.println(', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: 'mango', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ');\n\n', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '// Output:\n', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
                              new TextSpan(text: '579', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height:10),
              Text(
                "Method 2: Printing the variable along with some words(technically called String)",
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
                              new TextSpan(text: 'System.out.println("The value of mango is "', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: ' + ', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: 'mango', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ');\n\n', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '// Output:\n', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
                              new TextSpan(text: 'The value of mango is 579', style: new TextStyle(color: Colors.black, fontSize: 16,),),
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
                "Notice that the variable has to be out of the words in double quotes and must be separated from them with a + operator",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Printing more than one variable can be done in the same way:",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "int mango = 579;",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                "int apple = 24;",
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
                              new TextSpan(text: 'System.out.println("The mango is "', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: ' + ', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: 'mango', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ' + ', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: '". The apple is "', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: ' + ', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: 'apple', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ' + ', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: '".");\n\n', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '// Output:\n', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
                              new TextSpan(text: 'The mango is 579. The apple is 24.', style: new TextStyle(color: Colors.black, fontSize: 16,),),
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
