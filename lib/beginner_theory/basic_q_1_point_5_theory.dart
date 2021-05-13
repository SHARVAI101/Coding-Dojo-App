import 'package:flutter/material.dart';

class BasicQuestion1point5Theory extends StatefulWidget {
  @override
  _BasicQuestion1point5TheoryState createState() => _BasicQuestion1point5TheoryState();
}

class _BasicQuestion1point5TheoryState extends State<BasicQuestion1point5Theory> {
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
                "Using Variables",
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
                "Earlier, we used variables to store some data. Now we will use the data stored inside them to carry out operations.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "We usually use variables of the same data types while carrying out mathematical operations. But this doesnt hold true always. You can store one type of variables into another type as well but for that, type conversion is required which you will learn later. Eg: int in float, float in double, etc.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "To add two variables, we just do the following,",
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
                              new TextSpan(text: 'int', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: ' x ', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '=', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: ' y ', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '+', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: ' z ', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ';', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Where x, y and z are variables.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Storing the value of a inside b is done as follows:",
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
                              new TextSpan(text: ' b ', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '=', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: ' a ', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ';', style: new TextStyle(color: Colors.black, fontSize: 16,),),
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
                "Similarly, you can multply, divide or subtract variables and do a lot more with them such as use them in conditions, etc.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
