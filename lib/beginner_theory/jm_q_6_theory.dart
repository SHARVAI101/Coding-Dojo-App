import 'package:flutter/material.dart';

class JavaMathQuestion6Theory extends StatefulWidget {
  @override
  _JavaMathQuestion6TheoryState createState() => _JavaMathQuestion6TheoryState();
}

class _JavaMathQuestion6TheoryState extends State<JavaMathQuestion6Theory> {

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
                "Discount",
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
                "We know that,",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 5,),
              Text(
                "discount = discount percent * original selling price",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 13,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "which means, the math equation is,",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    Text(
                      "d = ",
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
                    Column(
                      children: [
                        Text(
                          " dp ",
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
                          "100",
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
                      " *",
                      style: TextStyle(
                        fontFamily: 'FreeSans',
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      " osp ",
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
