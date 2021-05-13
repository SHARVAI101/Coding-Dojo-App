import 'dart:async';
import 'dart:io';

import 'package:coding_dojo_app/allchapterspage.dart';
import 'package:coding_dojo_app/allrankspage.dart';
import 'package:coding_dojo_app/chapterpage.dart';
import 'package:coding_dojo_app/feedback1.dart';
import 'package:coding_dojo_app/feedback3.dart';
import 'package:coding_dojo_app/feedbackpage.dart';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/homepage_rank.dart';
import 'package:coding_dojo_app/models/chapter_model.dart';
import 'package:coding_dojo_app/myaccountpage.dart';
import 'package:coding_dojo_app/rankuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:launch_review/launch_review.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:rating_dialog/rating_dialog.dart';
// import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:clipboard/clipboard.dart';
import 'package:coding_dojo_app/basic_question_1_page.dart';
import 'package:coding_dojo_app/logicgrowthpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _percent=0.0;
  String _percentString="0%";

  // RateMyApp rateMyApp = RateMyApp(
  //   preferencesPrefix: 'rateMyApp_',
  //   minDays: 5,
  //   minLaunches: 3,
  //   remindDays: 7,
  //   remindLaunches: 10,
  //   googlePlayIdentifier: 'com.traveltest.coding_dojo_app',
  // );

  @override
  void initState() {
    super.initState();

    // this is done to prevent setState() being called during first widget build
    /*new Timer(new Duration(milliseconds: 200), () {
      getUserInfo();
    });*/

    int _questionsCompleted = 0;
    int _total_questions = GlobalVariables.questionslist.length;
    for(int i=0; i < GlobalVariables.questionslist.length; i++)
    {
      if (GlobalVariables.questionslist[i][5] == 1)
      {
        _questionsCompleted++;
      }
    }
    print(_total_questions);
    setState(() {
      _percent = (_questionsCompleted / _total_questions);
      _percent=double.parse(_percent.toStringAsFixed(2));
      print(_percent);
      _percentString=(_percent*100).toInt().toString()+"%";
      print(_percentString);
    });

    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await rateMyApp.init();
    //   print("in here");
    //   // print(rateMyApp.shouldOpenDialog);
    //   if (mounted && rateMyApp.shouldOpenDialog) {
    //     // rateMyApp.showRateDialog(context);
    //     print("yes");
    //     rateMyApp.showStarRateDialog(
    //       context,
    //       title: 'Rate this app', // The dialog title.
    //       message: 'Do you like our Dojo? Please consider dropping a review for this app to help us improve! :', // The dialog message.
    //       // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
    //       actionsBuilder: (context, stars) { // Triggered when the user updates the star rating.
    //         return [ // Return a list of actions (that will be shown at the bottom of the dialog).
    //           FlatButton(
    //             child: Text('OK'),
    //             onPressed: () async {
    //               print('Thanks for the ' + (stars == null ? '0' : stars.round().toString()) + ' star(s) !');
    //               // You can handle the result as you want (for instance if the user puts 1 star then open your contact page, if he puts more then open the store page, etc...).
    //               // This allows to mimic the behavior of the default "Rate" button. See "Advanced > Broadcasting events" for more information :
    //               await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
    //               Navigator.pop<RateMyAppDialogButton>(context, RateMyAppDialogButton.rate);
    //               LaunchReview.launch();
    //             },
    //           ),
    //         ];
    //       },
    //       ignoreNativeDialog: Platform.isAndroid, // Set to false if you want to show the Apple's native app rating dialog on iOS or Google's native app rating dialog (depends on the current Platform).
    //       dialogStyle: DialogStyle( // Custom dialog styles.
    //         titleAlign: TextAlign.center,
    //         messageAlign: TextAlign.center,
    //         messagePadding: EdgeInsets.only(bottom: 20),
    //       ),
    //       starRatingOptions: StarRatingOptions(), // Custom star bar rating options.
    //       onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
    //     );
    //   }
    // });


    /*WidgetsBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var launches=prefs.getInt("launches");
      if(launches==null) {
        await prefs.setInt('launches', 0);
        await prefs.setInt('is_app_reviewed', 0);
        launches=0;
        print("launches set to 0");
      }
      var is_app_reviewed=prefs.getInt("is_app_reviewed");
      launches+=1;
      print("launches="+launches.toString());
      print("is_app_reviewed="+is_app_reviewed.toString());
      if(is_app_reviewed==0 && (launches==3 || launches%10==0)) {
        // launches+=1;
        print("showing dialog");
        showDialog(
            context: context,
            barrierDismissible: true,
            // set to false if you want to force a rating
            builder: (context) {
              return RatingDialog(
                icon: Image.asset(
                  "assets/icons/katana_icon2.png",
                  width: 100,
                  height: 100
                ),
                // set your own image/icon widget
                title: "Do you like the Dojo?",
                description:
                "Please consider dropping a review for this app to help us improve! It helps a lot!",
                submitButton: "SUBMIT",
                //alternativeButton: "Contact us instead?",
                // optional
                positiveComment: "Hell yeah, Samurai!",
                // optional
                negativeComment: "Our swords need more sharpening :(",
                // optional
                accentColor: Colors.red,
                // optional
                onSubmitPressed: (int rating) {
                  print("onSubmitPressed: rating = $rating");
                  setappreviewed();
                  // TODO: open the app's page on Google Play / Apple App Store
                  LaunchReview.launch();
                },
                // onAlternativePressed: () {
                //   print("onAlternativePressed: do something");
                //   // TODO: maybe you want the user to contact you instead of rating a bad review
                //   setappreviewed();
                //   // TODO: open the app's page on Google Play / Apple App Store
                //   LaunchReview.launch();
                // },
              );
            }
        );
      }
      await prefs.setInt('launches', launches);

    });*/
  }

  /*Future<void> setappreviewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('is_app_reviewed', 1);
  }*/

  double calcpercent(){
    int _questionsCompleted = 0;
    int _total_questions = GlobalVariables.questionslist.length;
    for(int i=0; i < GlobalVariables.questionslist.length; i++)
    {
      if (GlobalVariables.questionslist[i][5] == 1)
      {
        _questionsCompleted++;
      }
    }
    print(_total_questions);
    _percent = (_questionsCompleted / _total_questions);
    _percent=double.parse(_percent.toStringAsFixed(2));
    print(_percent);
    _percentString=(_percent*100).toInt().toString()+"%";
    print(_percentString);
    double per=_percent;
    return per;
  }

  /*Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var _points=await prefs.getInt("points");
    var _rank=await prefs.getInt("rank");
    if(_points!=null)
      GlobalVariables.points=prefs.getInt("points");
    else
      GlobalVariables.points=0;

    if(_rank!=null)
      GlobalVariables.rank=prefs.getInt("rank");
    else
      GlobalVariables.rank=0;

    print("rank="+prefs.getInt("rank").toString());

    List<String> completion_status_string = (prefs.getStringList('completion_status') ?? List<String>()) ;
    List<int> completion_status = completion_status_string.map((i)=> int.parse(i)).toList();
    print("cs length="+completion_status.length.toString());
    if(completion_status.length>0){
      for(int i = 0; i < GlobalVariables.questionslist.length; i++){
        GlobalVariables.questionslist[i][5]=completion_status[i];
      }
    }

    List<String> timetakenlist_string = (prefs.getStringList('timetakenlist') ?? List<String>()) ;
    List<double> timetakenlist = timetakenlist_string.map((i)=> double.parse(i)).toList();
    if(timetakenlist.length>0) {
      for (int i = 0; i < GlobalVariables.questionslist.length; i++) {
        GlobalVariables.questionslist[i][6] = timetakenlist[i];
      }
    }

    setState(() {
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset(
                (GlobalVariables.isPremiumUser==true)?'assets/icons/crown.png':'assets/icons/free.png',
                fit: BoxFit.cover,
              ),
              // Icon(
              //   Icons.account_circle,
              //   color: Colors.white,
              // ),
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAccount()),
              );
            },
          ),
          //toolbarHeight: 60,

          title: Padding(
            padding: const EdgeInsets.only(top: 23.0),
            child: Text('ACCOUNT',
              style: GoogleFonts.overpass
                (
                textStyle: TextStyle(
                  fontSize: 27,
                  color: Color(0xFFEFF0F4),
                )
              ),
              /*style: TextStyle(
                fontSize: 30,
                color: Color(0xFFEFF0F4),
              ),*/
            ),
          ),
//          backgroundColor: Color(0xFFE62A6E),
//            backgroundColor: Colors.white,
          backgroundColor: Color(0xFF18214C),
          elevation: 0.0,
          /*leading: Icon(
            Icons.dehaze,
            color: Color(0xFFEFF0F4),
          ),*/
        ),
      ),
      body: Column(
          children: <Widget>[
            Container(
              color: Color(0xFF18214C),
              height: 205.0,
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(35, 25.0, 35, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          new Container(
                            width: 110.0,
                            height: 110.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(new Radius.circular(65.0)),
                              border: new Border.all(
                                color:  Color(0xFFEFF0F4),
                                width: 4.0,
                              ),
                            ),
                            child: Center(
                              child: FlatButton(
                                child: Image.asset(
                                  GlobalVariables.rankslist[GlobalVariables.rank][2],
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomePageRank()),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width:110,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      GlobalVariables.rankslist[GlobalVariables.rank][0],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        //fontWeight: FontWeight.bold,
                                        color: Color(0xFFEFF0F4),
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: VerticalDivider(
                          color: Color(0xFFEFF0F4),
                          thickness: 2,
                          width: 30,
                          indent: 20,
                          endIndent: 60,
                        ),
                      ),
                      /*Padding(
                        padding: const EdgeInsets.only(bottom: 45),
                        child: Container(
                          child: CircularPercentIndicator(
                            radius: 105.0,
                            lineWidth: 8.0,
                            animation: true,
                            percent: calcpercent(),
                            center: new Text(
                              _percentString,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Color(0xFFEFF0F4),
                              ),
                            ),
                            footer: Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: new Text(
                                "PROGRESS",
                                style: new TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Color(0xFFEFF0F4),
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Color(0xFFE62A6E),
                            backgroundColor: Color(0xFFEFF0F4),
                          ),
                        ),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.only(bottom: 45),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: new Text(
                                  GlobalVariables.points.toString(),
                                  style: new TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 45.0,
                                    color: Color(0xFFEFF0F4),
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: new Text(
                                  "POINTS",
                                  style: new TextStyle(
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Color(0xFFEFF0F4),
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                    ],
                  )
              ),
            ),
            Container(
              // color: Color(0xFFEFF0F4),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 25, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'MENU',
                        style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    //SizedBox(width: 110),
                    SizedBox(
                      height: 35,
                      // width: 115,
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AllRanks()),
                          );
                        },
                        child: Text(
                            'View Ranks',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),

                        ),
                        color: Color(0xFF18214C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //SizedBox(height: 10),
            Container(
              // color: Color(0xFFEFF0F4),
              height: MediaQuery.of(context).size.height-357-60,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  /*Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20,),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogicGrowthPage()),
                        ).then((value) {
                          setState(() {

                          });
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),

                      //color: Color(0xFFE62A6E),
                      //textColor: Colors.white,
                      color:  Colors.white,
                      textColor: Colors.black54,
                      padding: EdgeInsets.fromLTRB(10.0, 12.0, 18.0, 12.0),
                      splashColor: Color(0xFF18214C),

                      child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 75.0,
                            height: 75.0,
                            decoration: new BoxDecoration(
                              color: Color(0xFF18214C),
                              borderRadius: new BorderRadius.all(new Radius.circular(65.0)),
                              border: new Border.all(
                                color:  Colors.white,
                                width: 4.0,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/rocket256.png',
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ),
                          SizedBox(
                            width:215,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, bottom: 0, top: 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'LOGIC GROWTH',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          letterSpacing: 0.5,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        'NEW UPDATE',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12.0,
                                          letterSpacing: 0.5,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Icon(
                                //   Icons.arrow_forward_ios,
                                //   //color: Color(0xFFE62A6E),
                                //   color: Colors.green,
                                //   size: 28,
                                // ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),*/
                  /*Padding(
                    padding: EdgeInsets.only(top: 15, left: 20, right: 20,),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AllChapters()),
                        ).then((value) {
                          setState(() {

                          });
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),

                      //color: Color(0xFFE62A6E),
                      //textColor: Colors.white,
                      color:  Colors.white,
                      textColor: Colors.black54,
                      padding: EdgeInsets.fromLTRB(10.0, 12.0, 18.0, 12.0),
                      splashColor: Color(0xFF18214C),

                      child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 75.0,
                            height: 75.0,
                            decoration: new BoxDecoration(
                              color: Color(0xFF18214C),
                              borderRadius: new BorderRadius.all(new Radius.circular(65.0)),
                              border: new Border.all(
                                color:  Colors.white,
                                width: 4.0,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/katana.png',
                                height: 45,
                                width: 45,
                              ),
                            ),
                          ),
                          SizedBox(
                            width:215,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15, bottom: 0, top: 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'HARDCORE MODE',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          letterSpacing: 0.5,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Icon(
                                //   Icons.arrow_forward_ios,
                                //   //color: Color(0xFFE62A6E),
                                //   color: Colors.green,
                                //   size: 28,
                                // ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),*/
                  SizedBox(height:15),

                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(10.0, 0, 18.0, 0),
                  //   child: FlatButton(
                  //     child:Row(
                  //       children: [
                  //         // Icon(
                  //         //   Icons.content_copy
                  //         // ),
                  //         // SizedBox(width:5),
                  //         Expanded(
                  //           child: Text(
                  //             "Share Coding Dojo's link with your friends",
                  //             style: GoogleFonts.montserrat(
                  //             )
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     onPressed: (){
                  //       ClipboardManager.copyToClipBoard("https://play.google.com/store/apps/details?id=com.traveltest.coding_dojo_app").then((result) {
                  //         Fluttertoast.showToast(
                  //             msg: "Link Copied, Thanks homie",
                  //             toastLength: Toast.LENGTH_SHORT,
                  //             gravity: ToastGravity.BOTTOM,
                  //             timeInSecForIosWeb: 1,
                  //             backgroundColor: Colors.red,
                  //             textColor: Colors.white,
                  //             fontSize: 16.0
                  //         );
                  //       });
                  //     },
                  //   ),
                  // )
                  Padding(
                    padding: EdgeInsets.only(top: 0, left: 20, right: 20,),
                    child: Container(
                      decoration: new BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500],
                            offset: Offset(2.0, 4.5),
                            blurRadius:7,
                          ),
                        ]
                      ),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Feedback3()),
                          ).then((value) {
                            setState(() {

                            });
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),

                        ),

                        //color: Color(0xFFE62A6E),
                        //textColor: Colors.white,
                        color:  Colors.white,
                        textColor: Colors.black54,
                        padding: EdgeInsets.fromLTRB(10.0, 12.0, 18.0, 12.0),
                        splashColor: Color(0xFF18214C),

                        child: Row(
//                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 75.0,
                              height: 75.0,
                              decoration: new BoxDecoration(
                                color: Colors.grey[400],
                                borderRadius: new BorderRadius.all(new Radius.circular(65.0)),
                                border: new Border.all(
                                  color:  Colors.white,
                                  width: 4.0,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/feedback.png',
                                  height: 35,
                                  width: 35,
                                ),
                              ),
                            ),
                            SizedBox(
                              width:215,

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15, bottom: 0, top: 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'FEEDBACK',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            letterSpacing: 0.5,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Icon(
                                  //   Icons.arrow_forward_ios,
                                  //   //color: Color(0xFFE62A6E),
                                  //   color: Colors.green,
                                  //   size: 28,
                                  // ),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height:45),
                  // Text(
                  //     'This page is still under development!',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.grey[700],
                  //       fontSize: 15,
                  //     )
                  // ),
                ],
              ),
            )

          ]),
      floatingActionButton: FloatingActionButton.extended(

          onPressed: (){
            FlutterClipboard.copy('https://play.google.com/store/apps/details?id=com.traveltest.coding_dojo_app').then(( value ) {
            // ClipboardManager.copyToClipBoard("https://play.google.com/store/apps/details?id=com.traveltest.coding_dojo_app").then((result) {
              Fluttertoast.showToast(
                  msg: "Link Copied, thanks homie",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red[400],
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            });
          },
          label:Text(
              "Share\nCoding Dojo",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 11
              )
          ),
          icon: Icon(
              Icons.content_copy
          ),
        backgroundColor: Colors.pink[400],
      ),
    );
  }
}
