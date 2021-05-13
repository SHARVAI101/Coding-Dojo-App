import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "FEEDBACK",
            style: TextStyle(
              color: Colors.grey[200],
            ),
          ),
//          backgroundColor: Color(0xFFE62A6E),
          backgroundColor: Color(0xFF18214C),
          elevation: 50.0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey[200],
              size: 20,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // SizedBox(height: 25,),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(10,0,10,0),
              //   child: Text(
              //     "Refund Policy",
              //     style: GoogleFonts.overpass(
              //       textStyle: TextStyle(
              //           color: Colors.grey,
              //           fontSize: 20
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height:5),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: Text(
                  "We greatly value your feedback as well as any complaints you might have.\nPlease write to us at:",
                  style: GoogleFonts.overpass(
                    textStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "meaglconnect@gmail.com",
                    style: GoogleFonts.overpass(
                      textStyle: TextStyle(
                          color: Color(0xFF18214C),
                          fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:20),
            ],
          ),
        )
    );
  }
}
