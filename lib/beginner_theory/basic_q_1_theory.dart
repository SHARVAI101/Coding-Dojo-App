import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicQuestion1Theory extends StatefulWidget {
  @override
  _BasicQuestion1TheoryState createState() => _BasicQuestion1TheoryState();
}

class _BasicQuestion1TheoryState extends State<BasicQuestion1Theory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,30.0,20.0,20.0),
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Text(
                "Declaring Variables",
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
                "A variable in a program holds data that can be used whenever needed. These variables have names and creating such a  \"data-holder\" is known as \"declaring a variable\".",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Now a variable can be of the types Integer(denoted by int), Float(denoted by float), Double(denoted by double), Char(denoted by char), String(denoted by String), etc.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Declaring these variables in Java is done in the following way:",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new ListTile(
                    // leading: new MyBullet(),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: MyBullet(),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'int variablename = value; (Note: the semicolon is used to signify the end of a line in Java)',
                              style: TextStyle(
                                fontFamily: 'FreeSans',
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: MyBullet(),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: new Text(
                              'float variablename = value;',
                              style: TextStyle(
                                fontFamily: 'FreeSans',
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: MyBullet(),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: new Text(
                              'double variablename = value;',
                              style: TextStyle(
                                fontFamily: 'FreeSans',
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Example :',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 15),
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
                              new TextSpan(text: '// Declaring Variables\n\n', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
                              new TextSpan(text: 'float  ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: 'sum = 0.0f;\n', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '// float variables need to have an \'f\' at the end of their value while being declared\n\n', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
                              new TextSpan(text: 'int  ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: 'remainder = 780;', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Here, we declared variables sum and remainder and assigned sum a value of 0 and remainder a value of 780.',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

