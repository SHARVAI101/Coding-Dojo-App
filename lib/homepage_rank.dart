import 'dart:ui';

import 'package:coding_dojo_app/globalvars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePageRank extends StatefulWidget {
  @override
  _HomePageRankState createState() => _HomePageRankState();
}

class _HomePageRankState extends State<HomePageRank> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF0F1010),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/rankback1.jpg"),
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
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // do something
                  },
                )
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
            ),
          ),
        )
    );
  }
}
