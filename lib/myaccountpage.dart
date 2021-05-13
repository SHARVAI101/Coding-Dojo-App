import 'package:coding_dojo_app/coding_dojo_store.dart';
import 'package:coding_dojo_app/feedbackpage.dart';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/refundpolicypage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expansion_card/expansion_card.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MY ACCOUNT",
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
            new Container(
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                color: Color(0xFF18214C),
                shape: BoxShape.circle,
                border: new Border.all(
                  color:  Colors.white,
                  width: 4.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  (GlobalVariables.isPremiumUser==true)?'assets/icons/crown.png':'assets/icons/free.png',
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Text(
                (GlobalVariables.isPremiumUser==true)?"PREMIUM MEMBER":"FREE MEMBER",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: (GlobalVariables.isPremiumUser==true)?Color(0xFFFE8100):Colors.green,
                    shadows: (GlobalVariables.isPremiumUser==true)?<Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.grey,
                      ),
                    ]:<Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ),
            ),
            SizedBox(height:40),
            (GlobalVariables.isPremiumUser==false)?Padding(
              padding: const EdgeInsets.fromLTRB(10,0,10,0),
              child: Text(
                "Get access to all questions FOREVER and\nmaster the art of coding",
                style: GoogleFonts.overpass(
                    textStyle: TextStyle(
                      color: Color(0xFFFE8100),
                      fontSize: 15
                    )
                ),
              ),
            ):Container(),
            (GlobalVariables.isPremiumUser==false)?SizedBox(height:10):SizedBox(height: 0,),
            (GlobalVariables.isPremiumUser==false)?RaisedButton(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: Colors.red, width: 2)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/crown.png',
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width:10),
                  Text(
                    "UNLOCK ALL QUESTIONS",
                    style: GoogleFonts.overpass(
                      textStyle: TextStyle(
                        color: Color(0xFFFE8100),
                        fontSize: 20
                      )
                    ),
                  ),
                  SizedBox(width:10),
                  Image.asset(
                    'assets/icons/crown.png',
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CodingDojoStore()),
                );
              },
            ):Container(),
            // SizedBox(height:30),
            ExpansionCard(
              initiallyExpanded: (GlobalVariables.isPremiumUser==true)?true:false,
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "More Options",
                    ),
                  ],
                ),
              ),
              children: <Widget>[
                FlatButton(
                  color: Colors.transparent,
                  padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: Color(0xFFd3d3d3),
                          borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/refund.png',
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Text(
                        "Refund Policy",
                        style: GoogleFonts.overpass(
                          textStyle: TextStyle(
                              color: Color(0xFF636e72),
                              fontSize: 18
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RefundPolicy()),
                    );
                  },
                ),
                FlatButton(
                  color: Colors.transparent,
                  padding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: Color(0xFFd3d3d3),
                          borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/feedback.png',
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Text(
                        "Feedback / Complaints",
                        style: GoogleFonts.overpass(
                          textStyle: TextStyle(
                              color: Color(0xFF636e72),
                              fontSize: 18
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackPage()),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height:20)
          ],
        ),
      )
    );
  }
}
