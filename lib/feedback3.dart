import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Feedback3 extends StatefulWidget {
  @override
  _Feedback3State createState() => _Feedback3State();
}

class _Feedback3State extends State<Feedback3> {

  final emailController = TextEditingController();
  final anythingController = TextEditingController();

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
                  "email":(emailController.text!=null)?emailController.text:"NA",
                  "anything else":(anythingController.text!=null)?anythingController.text:"NA"
                };

                // ignore: deprecated_member_use
                // Firestore.instance.collection('feedback_collection').add(feedbackData);
                // ignore: deprecated_member_use
                Firestore.instance.collection('feedback_collection').doc("direct feedback "+DateTime.now().toString()).set(feedbackData);
              }
              saveData();
              print("here");
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
                "1. Enter your feedback",
                style: TextStyle(
                  fontFamily: 'FreeSans',
                  fontSize: 18,
                ),
              ),
              SizedBox(height:10),
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Tell us literally anything'
                ),
                controller: anythingController,
              ),
              SizedBox(height: 20),
              Text(
                "2. If you would like a follow up, enter your email. (optional)",
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
