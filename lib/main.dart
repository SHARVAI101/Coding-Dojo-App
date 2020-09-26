import 'dart:async';

import 'package:coding_dojo_app/homepage.dart';
import 'package:coding_dojo_app/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xFF0F1010),
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _onBoardingSeen = -1;

  Future<void> checkIntroSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _onSeen = (prefs.getBool('onBoardingSeen') ?? false);
    print(_onSeen);
    if (_onSeen) {
      setState(() {
        _onBoardingSeen = 1;//redirect to homepage
      });
      //return 1;
    } else {
      setState(() {
        _onBoardingSeen = 0;//redirect to onboarding
      });
      //return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      checkIntroSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_onBoardingSeen == -1) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
            builder: (context) => Scaffold(
                resizeToAvoidBottomPadding: false,
                body: Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.red[300])))
            ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (_onBoardingSeen==0) ? OnBoardingPage() : HomePage(),
    );
  }
}

