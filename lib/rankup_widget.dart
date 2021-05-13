
import 'dart:async';

import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/homepage_rank.dart';
import 'package:coding_dojo_app/logicgrowth_rankup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RankUpWidget extends StatefulWidget {
  final int incpoints;
  RankUpWidget({Key key, @required this.incpoints}) : super(key: key);

  @override
  _RankUpWidgetState createState() => _RankUpWidgetState();
}

class _RankUpWidgetState extends State<RankUpWidget> {

  var _rank;
  var _percent;
  bool _hasRankIncreased = false;
  bool _animationEnd=false;

  @override
  void initState() {
    super.initState();

    GlobalVariables.oldrank=GlobalVariables.rank;
    _rank = GlobalVariables.oldrank;

    print(_percent);

    if((GlobalVariables.points+widget.incpoints)>GlobalVariables.rankslist[GlobalVariables.rank][4]){
      _percent = 1.0;
      GlobalVariables.rank+=1;
      _hasRankIncreased=true;
    }
    else{
      _percent = ((GlobalVariables.points-GlobalVariables.rankslist[GlobalVariables.rank][3])+widget.incpoints)/200;
    }

    GlobalVariables.points+=widget.incpoints;

    setprefs();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> setprefs()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('points', GlobalVariables.points);
    await prefs.setInt('rank', GlobalVariables.rank);
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      // color: Color(0xFF0F1010),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                '+'+widget.incpoints.toString()+' points',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Color(0xffffa502)
                ),
              ),
              SizedBox(height:5),
              (_rank==15)?Wrap():LinearPercentIndicator(
                width: 150,
                animation: true,
                animationDuration: 800,
                lineHeight: 4,
                leading: Image.asset(
                  GlobalVariables.ranks_smallicons_list[_rank][0],
                  width: 30,
                  fit: BoxFit.cover,
                ),
                trailing: Image.asset(
                  GlobalVariables.ranks_smallicons_list[_rank+1][0],
                  width: 30,
                  fit: BoxFit.cover,
                ),
                percent: _percent,
                linearStrokeCap: LinearStrokeCap.butt,
                progressColor:  Color(0xffffa502),
                backgroundColor:Colors.grey[300],
                onAnimationEnd: (){
                  if(GlobalVariables.rank>GlobalVariables.oldrank && _animationEnd==false){
                    _animationEnd=true;// this is to prevent this function being called twice
                    // twice because one will be before the rank up and the second animation will be after the rank up
                    _rank+=1;
                    print("new rank = "+_rank.toString());
                    if(GlobalVariables.rank<15) {
                      _percent = ((GlobalVariables.points -GlobalVariables.rankslist[GlobalVariables.rank][3]))/200;
                      print("new percent = "+_percent.toString());
                    }
                    else {
                      _percent = 0;
                    }

                    Timer(Duration(seconds:1),(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LogicGrowthRankUp()),
                      );
                    });
                  }
                  setState(() {

                  });

                },
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CircularPercentIndicator(
                    radius: 60.0,
                    animation: true,
                    animationDuration: 800,
                    lineWidth: 2.0,
                    percent: 0.4,
                    center: Image.asset(
                      GlobalVariables.ranks_smallicons_list[_rank][0],
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    circularStrokeCap: CircularStrokeCap.butt,
                    backgroundColor: Colors.grey[300],
                    progressColor: Colors.pink,
                    onAnimationEnd: (){
                      setState(() {
                        _rank+=1;
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                          GlobalVariables.points.toString()+" Points",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          )
                      ),
                      Text(
                          GlobalVariables.rankslist[_rank][0],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            //fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          )
                      ),
                    ],
                  )
                ],
              ),*/
            ],
          ),
        ],
      ),
    );
  }
}



// anjali design
// Container(
// // color: Color(0xFF0F1010),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Wrap(
// direction: Axis.vertical,
// alignment: WrapAlignment.center,
// crossAxisAlignment: WrapCrossAlignment.center,
// children: [
// CircularPercentIndicator(
// radius: 100.0,
// animation: true,
// animationDuration: 800,
// lineWidth: 4.0,
// percent: 0.4,
// center: Image.asset(
// GlobalVariables.rankslist[_rank][2],
// width: 75,
// fit: BoxFit.cover,
// ),
// circularStrokeCap: CircularStrokeCap.butt,
// backgroundColor: Colors.grey[300],
// progressColor: Colors.deepOrangeAccent,
// // onAnimationEnd: (){
// //   setState(() {
// //     _rank+=1;
// //   });
// // },
// ),
// SizedBox(height: 10),
// Text(
// GlobalVariables.rankslist[_rank][0],
// textAlign: TextAlign.center,
// style: GoogleFonts.montserrat(
// fontSize: 25,
// //fontWeight: FontWeight.bold,
// color: Colors.grey[800],
// )
// ),
// Text(
// GlobalVariables.points.toString()+" Points",
// textAlign: TextAlign.center,
// style: GoogleFonts.montserrat(
// fontSize: 20,
// color: Colors.grey[500],
// )
// )
// ],
// ),
// ],
// ),
// );