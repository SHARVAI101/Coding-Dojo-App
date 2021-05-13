import 'dart:ui';

import 'package:coding_dojo_app/globalvars.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogicGrowthRankUp extends StatefulWidget {
  @override
  _LogicGrowthRankUpState createState() => _LogicGrowthRankUpState();
}

class _LogicGrowthRankUpState extends State<LogicGrowthRankUp> {
  ConfettiController _controllerCenter;

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF0F1010),
    ));
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));

    _controllerCenter.play();
  }

  @override
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
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "NEW RANK",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40
                          ),
                        ),
                      ),
                      SizedBox(height:50),
                      Image(
                        image: AssetImage(
                          'assets/rank_icons/'+GlobalVariables.rank.toString()+'.png',
                        ),
                        width:200,
                      ),
                      SizedBox(height: 20,),
                      Text(
                        GlobalVariables.rankslist[GlobalVariables.rank][0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        GlobalVariables.rankslist[GlobalVariables.rank][1],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 150,
                    left: (MediaQuery. of(context). size. width-60)/2,
                    child: Align(
                      alignment: Alignment.center,
                      child: ConfettiWidget(
                        confettiController: _controllerCenter,
                        blastDirectionality: BlastDirectionality.explosive, // don't specify a direction, blast randomly
                        shouldLoop: false, // start again as soon as the animation is finished
                        colors: const [
                          Colors.green,
                          Colors.blue,
                          Colors.pink,
                          Colors.orange,
                          Colors.purple
                        ], // manually specify the co// define a custom shape/path.
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
