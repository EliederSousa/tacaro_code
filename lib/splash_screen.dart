import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreen();
  }
}

class _SplashScreen extends State<SplashScreen> {
  int splashtime = 4;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(
          //pushReplacement = replacing the route so that
          //splash screen won't show on back button press
          //navigation to Home page.
          builder: (context) {
        return Login();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //vertically align center
                children: <Widget>[
                  Container(
                      child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Image.asset("assets/images/logo.png"))),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    //margin top 30
                    child: Text(
                      "TACARO",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text("1.0.0",
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 20,
                        )),
                  ),
                ])));
  }
}
