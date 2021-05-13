import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/questionpage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:ui';

class RankUp extends StatefulWidget {
  var _rank=GlobalVariables.oldrank;
  var _points=GlobalVariables.points;
  // var _rank=1;
  // var _points=425;
  var _lowerlimit=GlobalVariables.rankslist[GlobalVariables.oldrank][3];
  var _upperlimit=GlobalVariables.rankslist[GlobalVariables.oldrank][4];

  @override
  _RankUpState createState() => _RankUpState();
}

class _RankUpState extends State<RankUp> {

  double _progress = 0;
  int counter=0;

  void startTimer(var _limit) {
    print("here"+counter.toString());

      //this if statement checks that this rankup widget (scaffold) has not been closed because you cant set the state of a widget that is closed(aka disposed)
      new Timer.periodic(Duration(milliseconds: 10),(Timer timer) {
        if(this.mounted) {
          setState(() {
            if (_progress >= _limit) {
              timer.cancel();
              print("returning");
              counter += 1;
              //now we check if there is a rank up (counter set kela so that parat parat haa
              // function call nako hoyla because fakta ekdach rank up hou shakto at a time)
              if (widget._points > widget._upperlimit && counter < 2 &&
                  GlobalVariables.rank != 15) {
                //mhanje rank up zhala ani rank 15 nasel tarach loading wala kar nahitar nahi
                print("in");
                print("difference:" + (widget._points -
                    GlobalVariables.rankslist[widget._rank + 1][3]).toString());
                print(
                    GlobalVariables.rankslist[widget._rank + 1][3].toString());
                var _limit2 = (widget._points -
                    GlobalVariables.rankslist[widget._rank + 1][3]) / 200;
                print(_limit2);
                if (this.mounted) {
                  setState(() {
                    _progress = 0;
                    // setting all global variables
                    widget._rank += 1;
                    GlobalVariables.oldrank += 1;
                  });
                }
                startTimer(_limit2);
              }
              // return;

            } else {
              _progress += 0.005;
            }
          });//set state
        }
      });
    }


  void handleProgressBar() {
    var _limit=(widget._points-widget._lowerlimit)/200;
    // var st=false;

    startTimer(_limit);
    // print(st.toString());
    /*if(widget._points>widget._upperlimit && st==true){
      //mhanje rank up zhala
      print("in");
      var _limit2=(widget._points-GlobalVariables.rankslist[widget._rank+1][3])/200;
      setState(() {
        _progress=0;
      });
      startTimer(_limit2);
    }*/
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF0F1010),
    ));
    handleProgressBar();
  }
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/rankback1-min.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Scaffold(
            backgroundColor:Colors.black.withOpacity(0.4),
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
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "RANK",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40
                      ),
                    ),
                  ),
                  SizedBox(height:50),
                  Image(
                    image: AssetImage(
                      'assets/rank_icons/'+widget._rank.toString()+'.png',
                    ),
                    width:200,
                  ),
                  SizedBox(height: 20,),
                  Text(
                    GlobalVariables.rankslist[widget._rank][0],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    GlobalVariables.rankslist[widget._rank][1],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontStyle: FontStyle.italic
                    ),
                  ),
                  SizedBox(height:20),
                  LinearProgressIndicator(
                    value: _progress,
                    //minHeight: 10,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[600]),
                    backgroundColor: Color(0xFFCCCCCC),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
