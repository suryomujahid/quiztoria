import 'package:flutter/material.dart';
import 'package:Quiztoria/layout.dart';
import 'package:Quiztoria/splash_screen.dart';

class LearnPages extends StatelessWidget {
  const LearnPages({Key key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: new AppBar(
      backgroundColor: HexColor("#2D3436"),
      title: new Text("Pilih Materi"),
    ),
    backgroundColor: Colors.white,
    body:new Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            width: double.infinity,
            image: AssetImage("images/underconstruction.png"),
          ),
          Text("Sedang tahap pembangunan!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: SizeConfig.blockVertical = 20)),
        ],
      )
    ),);
  }
}
