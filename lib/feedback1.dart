import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Feedback1 extends StatefulWidget {
  @override
  _Feedback1State createState() => _Feedback1State();
}

class _Feedback1State extends State<Feedback1> {

  int _radioValue = 0;
  int _usefulnessRadioValue = 1;
  final emailController = TextEditingController();
  final anythingController = TextEditingController();

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

  void _usefulnessHandleRadioValueChange(int value) {
    setState(() {
      _usefulnessRadioValue = value;
      print(_usefulnessRadioValue);
      switch (_usefulnessRadioValue) {
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
        case 4:
          break;
        case 5:
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
                  "like to see more?":(_radioValue==1)?"Yes":"No",
                  "usefulness":_usefulnessRadioValue.toString(),
                  "email":(emailController.text!=null)?emailController.text:"NA",
                  "anything else":(anythingController.text!=null)?anythingController.text:"NA"
                };

                // ignore: deprecated_member_use
                // Firestore.instance.collection('feedback_collection').add(feedbackData);
                // ignore: deprecated_member_use
                Firestore.instance.collection('feedback_collection').doc(DateTime.now().toString()).set(feedbackData);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Feedback",
                  style: TextStyle(
                    fontFamily: 'FreeSans',
                    fontSize: 30,
                  ),
                ),
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                  iconSize: 29,
                )
              ],
            ),
            Text(
              // "We want you to provide you with an app that you will love and so we would really appreciate your feedback.",
              "Logic Growth is still under development and we want to make sure that you'll love it, so we would really appreciate your feedback.",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 15,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "1. Would you like to see more of such questions?",
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
            SizedBox(height: 20),
            Text(
              "2. How useful is this app to you?",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 18,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Radio(
                  value: 1,
                  groupValue: _usefulnessRadioValue,
                  onChanged:_usefulnessHandleRadioValueChange,
                ),
                new Text(
                  '1',
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Radio(
                  value: 2,
                  groupValue: _usefulnessRadioValue,
                  onChanged: _usefulnessHandleRadioValueChange,
                ),
                new Text(
                  '2',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                new Radio(
                  value: 3,
                  groupValue: _usefulnessRadioValue,
                  onChanged: _usefulnessHandleRadioValueChange,
                ),
                new Text(
                  '3',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                new Radio(
                  value: 4,
                  groupValue: _usefulnessRadioValue,
                  onChanged: _usefulnessHandleRadioValueChange,
                ),
                new Text(
                  '4',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                new Radio(
                  value: 5,
                  groupValue: _usefulnessRadioValue,
                  onChanged: _usefulnessHandleRadioValueChange,
                ),
                new Text(
                  '5',
                  style: new TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "3. If you would like to help us improve our app, enter your email. (optional)",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 18,
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
            Text(
              "4. Any other feedback? (optional)",
              style: TextStyle(
                fontFamily: 'FreeSans',
                fontSize: 18,
              ),
            ),
            SizedBox(height:10),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tell us literally anything'
              ),
              controller: anythingController,
            ),
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
