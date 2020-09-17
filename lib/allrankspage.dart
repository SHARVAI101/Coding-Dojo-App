import 'dart:ui';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllRanks extends StatefulWidget {
  @override
  _AllRanksState createState() => _AllRanksState();
}

class _AllRanksState extends State<AllRanks> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/allranks2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Scaffold(
            backgroundColor:Colors.black.withOpacity(0.1),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: Text(
                "ALL RANKS",
                style: TextStyle(
                  fontSize: 30
                ),
              ),
            ),
            // backgroundColor:Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: GlobalVariables.rankslist.map((i){
                  if(GlobalVariables.rankslist.indexOf(i)!=15){
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                i[2],
                                width: 80,
                              ),
                              SizedBox(width:15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    i[0],
                                    style: TextStyle(
                                        fontSize: 23
                                    ),
                                  ),
                                  /*Container(
                                  height: 150,
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          i[1],
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey[500],
                                            fontStyle: FontStyle.italic
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )*/
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  else{
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset(
                                i[2],
                                width: 80,
                              ),
                              SizedBox(width:15),
                              Container(
                                height: 50,
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        i[0],
                                        style: TextStyle(
                                            fontSize: 23
                                        ),
                                      ),
                                    ),
                                    /*Container(
                                    height: 150,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            i[1],
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey[500],
                                              fontStyle: FontStyle.italic
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )*/
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                }).toList(),
              ),
            ),
          ),
        )
    );
  }
}
