import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreQuestionsPage extends StatefulWidget {
  @override
  _MoreQuestionsPageState createState() => _MoreQuestionsPageState();
}

class _MoreQuestionsPageState extends State<MoreQuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF3498db),
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
      body: Container(
        width: double.infinity,
        color: Color(0xFF3498db),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            scrollDirection: Axis.vertical,
            children: [
              Align(
                child: Text(
                  "That's It, For Now",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                "THIS",
                // textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
              Text(
                "MAY 10",
                // textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Color(0xfff9ca24),
                    fontSize: 55
                ),
              ),
              SizedBox(height: 30),
              Text(
                "We're adding,",
                // textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 23
                ),
              ),
              SizedBox(height:10),
              Row(
                children: [
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xffbadc58),
                  ),
                  Text(
                    "Rank-up points for logic growth questions",
                    // textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        color: Color(0xffbadc58),
                        fontSize: 20
                    ),
                  ),
                ],
              ),
              // SizedBox(height:5),
              // Row(
              //   children: [
              //     Icon(
              //       Icons.chevron_right,
              //       color: Color(0xffbadc58),
              //     ),
              //     Text(
              //       "5 More Questions",
              //       // textAlign: TextAlign.center,
              //       style: GoogleFonts.montserrat(
              //           color: Color(0xffbadc58),
              //           fontSize: 20
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height:5),
              Row(
                children: [
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xffbadc58),
                  ),
                  Text(
                    "1 Moderate Question",
                    // textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        color: Color(0xffbadc58),
                        fontSize: 20
                    ),
                  ),
                ],
              ),
              SizedBox(height:5),
              Row(
                children: [
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xffbadc58),
                  ),
                  Text(
                    "And a lot more love <3",
                    // textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        color: Color(0xffbadc58),
                        fontSize: 20
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
              Align(
                child: Text(
                  "Till then,\nHold your horses, Samurai",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
