import 'dart:ui';
import 'package:coding_dojo_app/new_onboarding/new_onboarding_2_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class NewOnboarding1Page extends StatefulWidget {
  @override
  _NewOnboarding1PageState createState() => _NewOnboarding1PageState();
}

class _NewOnboarding1PageState extends State<NewOnboarding1Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/rankback1-min.jpg"),
          // image: AssetImage("assets/images/allranks3-min.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Scaffold(
          backgroundColor:Colors.black.withOpacity(0.5),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              /*IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // do something
                  },
                )*/
            ],
          ),
          // backgroundColor:Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "WELCOME TO THE",
                        style: GoogleFonts.montserrat(
                            color: Colors.grey[500],
                            fontSize: 15
                        ),
                      ),
                    ),
                    SizedBox(height:10),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "CODING DOJO",
                        style: GoogleFonts.montserrat(
                            color: Colors.grey[300],
                            fontSize: 38
                        ),
                      ),
                    ),
                    SizedBox(height:50),
                    Image(
                      image: AssetImage(
                        'assets/icons/katana.png',
                      ),
                      width:200,
                    ),
                  ],
                ),

                SizedBox(
                  width: 270,
                  height: 60,
                  child: RaisedButton(
                    onPressed: () async{
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => BasicsPage()),
                      // );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => NewOnboarding2Page()),
                      );
                    },
                    elevation: 10,
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.white,
                    textColor: Colors.black,
                    child: Text(
                      'ENTER',
                      style: GoogleFonts.montserrat(
                          fontSize: 18
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
