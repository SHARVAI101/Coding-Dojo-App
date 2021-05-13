import 'package:flutter/material.dart';

class JavaMathQuestion7Theory extends StatefulWidget {
  @override
  _JavaMathQuestion7TheoryState createState() => _JavaMathQuestion7TheoryState();
}

class _JavaMathQuestion7TheoryState extends State<JavaMathQuestion7Theory> {

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
                "Temperatures",
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
                "Let,",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                "f be the temperature in Farenheit",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                "c be the temperature in Celcius",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "then,",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 0,),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Text(
                      "f = ",
                      style: TextStyle(
                        fontFamily: 'FreeSans',
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "(",
                      style: TextStyle(
                        fontFamily: 'FreeSans',
                        fontSize: 40,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      " c ",
                      style: TextStyle(
                        fontFamily: 'FreeSans',
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "* ",
                      style: TextStyle(
                        fontFamily: 'FreeSans',
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          " 9 ",
                          style: TextStyle(
                            fontFamily: 'FreeSans',
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(
                          width:30,
                          height: 4,
                          child: Divider(
                            color: Colors.grey[700],
                            thickness: 1,
                          ),
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                            fontFamily: 'FreeSans',
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      ")",
                      style: TextStyle(
                        fontFamily: 'FreeSans',
                        fontSize: 40,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      " + 32 ",
                      style: TextStyle(
                        fontFamily: 'FreeSans',
                        fontSize: 15,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Now, you just have to convert this into java math form.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
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
