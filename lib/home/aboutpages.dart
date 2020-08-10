import 'package:flutter/material.dart';
import 'package:Quiztoria/layout.dart';
import 'package:Quiztoria/splash_screen.dart';

class AboutPages extends StatelessWidget {
  const AboutPages({Key key}) : super(key: key);

  Widget personCard(String name, String images, String title){
    return Container(
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage(images),
          ),
          Text(name),
          Text(title),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Tentang Kami"),
        backgroundColor: HexColor("#2D3436"),
      ),
      backgroundColor: HexColor("#2D3436"),
      body: ListView(
        children: <Widget>[
          Image(
            image: AssetImage("images/meetteam.png"),
            width: double.infinity,
          ),
          Container(
            alignment: FractionalOffset.center,
            padding: EdgeInsets.all(10.0),
            child: Text(
              " Meet The Team ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.blockVertical = 24,
                color: Colors.white,
                backgroundColor: Colors.green[700] 
              ),
            ),
          ),


        ],
      ),
    );
  }
}
