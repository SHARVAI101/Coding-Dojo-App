import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefundPolicy extends StatefulWidget {
  @override
  _RefundPolicyState createState() => _RefundPolicyState();
}

class _RefundPolicyState extends State<RefundPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "REFUND POLICY",
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
                  " - Refunds can be issued only if you send a request for refund within 48 hours of your order.",
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
                child: Text(
                  " - To request a refund, you can mail us your order number and date (from your Google Play Order Receipt) to our email: meaglconnect@gmail.com",
                  style: GoogleFonts.overpass(
                    textStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
              SizedBox(height:20)
            ],
          ),
        )
    );
  }
}
