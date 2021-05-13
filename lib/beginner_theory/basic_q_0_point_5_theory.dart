import 'package:flutter/material.dart';

class BasicQuestion0point5Theory extends StatefulWidget {
  @override
  _BasicQuestion0point5TheoryState createState() => _BasicQuestion0point5TheoryState();
}

class _BasicQuestion0point5TheoryState extends State<BasicQuestion0point5Theory> {
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
                "Displaying Output",
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
                "Printing means to display output from the program. This output is displayed on a screen known as the console.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "This output can be anything from some information to data that needs to be displayed.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "In Java, we display output by using either of the following 2 ways:",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'System.out.println("some stuff");',
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.pink[300],
                ),
              ),
              Text(
                'OR',
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'System.out.print("some stuff");',
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.pink[300],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                'When we wish to print any words, we surround them with double quotes(").\nEg:',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
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
                              new TextSpan(text: 'System.out.println("', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: 'Josh vs Josh', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                              new TextSpan(text: '");\n\n', style: new TextStyle(color: Colors.grey[700], fontSize: 16,),),
                              new TextSpan(text: '// Output:\n', style: new TextStyle(color: Color(0xff008200), fontSize: 16,),),
                              new TextSpan(text: 'Josh vs Josh', style: new TextStyle(color: Colors.black, fontSize: 16,),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                  color: Colors.grey[800]
              ),
              SizedBox(height: 10),
              Text(
                'DIFFERENCE BETWEEN println() and print():',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'System.out.println("Hello");\nSystem.out.print("World");',
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.pink[300],
                ),
              ),
              Text(
                'OUTPUT:',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
              Text(
                'Hello\nWorld',
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.pink[300],
                ),
              ),
              SizedBox(height:10),
              Text(
                'But,',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
              Text(
                'System.out.print("Hello");\nSystem.out.println("World");',
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.pink[300],
                ),
              ),
              Text(
                'OUTPUT:',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
              Text(
                'HelloWorld',
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.pink[300],
                ),
              ),
              SizedBox(height:10),
              Text(
                'So, println() adds a new line once it prints its contents while print() doesn\'t.',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
              SizedBox(height:10),
              Text(
                'Note: The semicolon(;) is used to mark the end of a line of code in Java and is mandatory.',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
              SizedBox(height:10),
            ],
          ),
        ),
      ),
    );
  }
}
