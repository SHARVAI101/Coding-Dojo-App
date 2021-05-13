import 'package:flutter/material.dart';

class JavaMathQuestion2Theory extends StatefulWidget {
  @override
  _JavaMathQuestion2TheoryState createState() => _JavaMathQuestion2TheoryState();
}

class _JavaMathQuestion2TheoryState extends State<JavaMathQuestion2Theory> {
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
                "Float & Double",
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
                "Float and Double data types are used to store \"real\" numbers which basically means numbers with decimals.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Eg: 2.567, -45.9856, 0.03",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Now you might ask the difference between float and double. It's very easy,\n\n1. Float variables store smaller numbers as compared to Double variables.\n\n2. Also, while declaring float variables need to have an f attached to the end of their value while double variables don't.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Eg: ",
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
                              new TextSpan(text: 'float x = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '5.45', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: 'f', style: new TextStyle(color: Colors.pink, fontSize: 16,),),
                              new TextSpan(text: ';', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '\n\ndouble x = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '5.45', style: new TextStyle(color: Colors.black, fontSize: 16,),),
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
