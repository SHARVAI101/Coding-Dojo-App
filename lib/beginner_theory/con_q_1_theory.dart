import 'package:flutter/material.dart';

class ConditionsQuestion1Theory extends StatefulWidget {
  @override
  _ConditionsQuestion1TheoryState createState() => _ConditionsQuestion1TheoryState();
}

class _ConditionsQuestion1TheoryState extends State<ConditionsQuestion1Theory> {
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
                "If statements",
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
                "Conditions are statements that are used to decide how the program shall run. To check these conditions, we use something called an if statement.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "An if statement checks a condition (for example, if a variable is greater than another variable, if two numbers are equal, etc.) and if the condition results to be true, we execute the lines of code in the if block.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "Example,",
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
                              new TextSpan(text: 'if ( ', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '250 > 50', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: ' )', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '\n{', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '\n\t\t\t\t\t\tSystem.out.println("HIHIHI");', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '\n}', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
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
                "So, in this program, we check if 250 is greater than 50 and if it is true, the program will print HIHIHI.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Output:\nHIHIHI",
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

