import 'package:flutter/material.dart';

class NumbersQuestion1Theory extends StatefulWidget {
  @override
  _NumbersQuestion1TheoryState createState() => _NumbersQuestion1TheoryState();
}

class _NumbersQuestion1TheoryState extends State<NumbersQuestion1Theory> {
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
                "Odd or Even",
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
                "You might remember that the modulus operator is used to find the remainder of a division.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "For example, the remainder of 5/2 is 1.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Therefore, if we do ",
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
                              new TextSpan(text: 'int a = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '5', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ';', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '\nint b = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '2', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ';', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '\nint rem = ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: 'a % b', style: new TextStyle(color: Colors.black, fontSize: 16,),),
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
                "Then rem will be equal to 1.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Now, the remainder of any even number divided by 2 will always be equal to zero (eg., 6, 88, 12968, etc.) while the remainder of any odd number divided by 2 will always be 1 (eg., 5,15, 259, etc.).",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Therefore, if a number's remainder (obtained using the modulus operator) is 0, it is even.\nElse, it is odd.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.pink,
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
