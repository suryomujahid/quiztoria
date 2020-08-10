import 'dart:async';

import 'package:flutter/material.dart';
import 'package:Quiztoria/home/homepages.dart';
import 'package:Quiztoria/layout.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePages()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#2D3436"),
      body: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Quiztoria",
            style: TextStyle(
                fontFamily: "Raleway",
                fontSize: SizeConfig.blockVertical = 65,
                color: HexColor("#F5E51B")),
          ),
          Text(
            "version: 0.1",
            style: TextStyle(
                fontFamily: "Raleway", fontSize: SizeConfig.blockVertical=15, color: Colors.grey[700]),
          )
        ],
      )),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
