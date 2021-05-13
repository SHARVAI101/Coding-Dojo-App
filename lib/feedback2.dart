import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class Feedback2 extends StatefulWidget {
  @override
  _Feedback2State createState() => _Feedback2State();
}

class _Feedback2State extends State<Feedback2> {

  int _radioValue = 0;
  final reasonController = TextEditingController();
  final emailController = TextEditingController();

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      print(_radioValue);
      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

  _showConfirmDialog() async{
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Column(
          children: [
            // Icon(
            //   Icons.check_circle,
            //   color: Colors.green,
            //   size: 70,
            // ),
            // SizedBox(height: 10),
            Text(
              "Do you wish to submit your feedback?",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        // content: Text("You have raised a Alert Dialog Box"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("No"),
          ),
          FlatButton(
            onPressed: () async {
              Future<void> saveData() async{
                Map<String, dynamic> feedbackData = {
                  "open it again":(_radioValue==1)?"Yes":"No",
                  "reason":(reasonController.text!=null)?reasonController.text:"NA",
                  "email":(emailController.text!=null)?emailController.text:"NA",
                };

                // ignore: deprecated_member_use
                // Firestore.instance.collection('feedback_collection').add(feedbackData);
                // ignore: deprecated_member_use
                Firestore.instance.collection('feedback_collection').doc("feedback 2="+DateTime.now().toString()).set(feedbackData);
              }
              saveData();
              print("here");
              print("radioval="+_radioValue.toString());
              await _showDialog();
              Navigator.of(ctx).pop();
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  _showDialog() async{
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Column(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 70,
            ),
            SizedBox(height: 10),
            Text(
              "Feedback Submitted! THANK YOU!",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        // content: Text("You have raised a Alert Dialog Box"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(ctx).pop();
            },
            child: Text("Finish"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Feedback",
                  style: GoogleFonts.muli(
                    // fontFamily: 'FreeSans',
                    fontSize: 30,
                  ),
                ),
              ),
              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Align(
              //       alignment: Alignment.center,
              //       child: Text(
              //         "Feedback",
              //         style: TextStyle(
              //           fontFamily: 'FreeSans',
              //           fontSize: 30,
              //         ),
              //       ),
              //     ),
              //     IconButton(
              //       onPressed: (){
              //         Navigator.pop(context);
              //       },
              //       icon: Icon(
              //         Icons.clear,
              //         color: Colors.red,
              //       ),
              //       iconSize: 29,
              //     )
              //   ],
              // ),
              Text(
                // "We want you to provide you with an app that you will love and so we would really appreciate your feedback.",
                "This feedback directly affects our ability to serve you better!",
                style: GoogleFonts.muli(
                  fontSize: 20,
                  color: Color(0xffEA2027)
                ),
              ),
              SizedBox(height: 20),
              Text(
                "1. If you close this app, would you ever open it back up to learn?",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  new Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged:(int value) {
                      setState(() {
                        _radioValue = value;
                      });
                    },
                  ),
                  new Text(
                    'No',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(width: 20,),
                  new Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                  new Text(
                    'Yes',
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "2. If no, why not?",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 18,
                ),
              ),
              SizedBox(height:10),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Reason'
                ),
                controller: reasonController,
              ),
              SizedBox(height:20),
              // Text(
              //   "2. How useful is this app to you?",
              //   style: TextStyle(
              //     fontFamily: 'FreeSans',
              //     fontSize: 18,
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     new Radio(
              //       value: 1,
              //       groupValue: _usefulnessRadioValue,
              //       onChanged:_usefulnessHandleRadioValueChange,
              //     ),
              //     new Text(
              //       '1',
              //       style: new TextStyle(fontSize: 16.0),
              //     ),
              //     new Radio(
              //       value: 2,
              //       groupValue: _usefulnessRadioValue,
              //       onChanged: _usefulnessHandleRadioValueChange,
              //     ),
              //     new Text(
              //       '2',
              //       style: new TextStyle(
              //         fontSize: 16.0,
              //       ),
              //     ),
              //     new Radio(
              //       value: 3,
              //       groupValue: _usefulnessRadioValue,
              //       onChanged: _usefulnessHandleRadioValueChange,
              //     ),
              //     new Text(
              //       '3',
              //       style: new TextStyle(
              //         fontSize: 16.0,
              //       ),
              //     ),
              //     new Radio(
              //       value: 4,
              //       groupValue: _usefulnessRadioValue,
              //       onChanged: _usefulnessHandleRadioValueChange,
              //     ),
              //     new Text(
              //       '4',
              //       style: new TextStyle(
              //         fontSize: 16.0,
              //       ),
              //     ),
              //     new Radio(
              //       value: 5,
              //       groupValue: _usefulnessRadioValue,
              //       onChanged: _usefulnessHandleRadioValueChange,
              //     ),
              //     new Text(
              //       '5',
              //       style: new TextStyle(
              //         fontSize: 16.0,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 20),
              Text(
                "3. Directly tell us how you want our app to be like by entering your email.",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 18,
                ),
              ),
              Text(
                "(We promise to not pester you or share this email with any third parties.)",
                style: TextStyle(
                  // fontFamily: 'FreeSans',
                  fontSize: 15,
                  color: Color(0xff27ae60)
                ),
              ),
              SizedBox(height:10),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email address'
                ),
                controller: emailController,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: RaisedButton(
                    onPressed: (){
                      // Future<void> saveData() async{
                      //   Map<String, dynamic> feedbackData = {
                      //     "email":"sharvai101@gmail.com",
                      //     "like to see more?":(_radioValue==1)?"Yes":"No",
                      //     "usefulness":_usefulnessRadioValue.toString(),
                      //     "email":(emailController.text!=null)?emailController.text:"NA",
                      //     "anything else":(anythingController.text!=null)?anythingController.text:"NA"
                      //   };
                      //
                      //   // ignore: deprecated_member_use
                      //   // Firestore.instance.collection('feedback_collection').add(feedbackData);
                      //   // ignore: deprecated_member_use
                      //   Firestore.instance.collection('feedback_collection').doc(DateTime.now().toString()).set(feedbackData);
                      // }
                      // saveData();
                      // print("here");
                      // print("radioval="+_radioValue.toString());
                      // _showDialog();
                      _showConfirmDialog();
                    },
                    color: Color(0xFF18214C),
                    textColor: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/rank_icons/7.png',
                            height: 30,
                          ),
                          SizedBox(width:10),
                          Text(
                              'SUBMIT FEEDBACK'
                          ),
                          SizedBox(width:10),
                          Image.asset(
                            'assets/rank_icons/7.png',
                            height: 30,
                          ),
                        ],
                      ),
                    )
                ),
              )
            ],
          ),
        )
    );
  }
}
