import 'package:flutter/material.dart';
import 'package:Quiztoria/home/aboutpages.dart';
import 'package:Quiztoria/layout.dart';
import 'package:Quiztoria/quiz/learnpages.dart';
import 'package:Quiztoria/quiz/levelquiz.dart';
import 'package:Quiztoria/splash_screen.dart';

class HomePages extends StatefulWidget {
  HomePages({Key key}) : super(key: key);

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#2D3436"),
      body: new Column(
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Container(
                alignment: FractionalOffset.topRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AboutPages()));
                  },
                  child: new Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: SizeConfig.blockVertical = 30,
                  ),
                )),
          ),
          new Expanded(
              flex: 8,
              child: new Center(
                child: Text(
                  "Quiztoria",
                  style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: SizeConfig.blockVertical = 65,
                      color: HexColor("#F5E51B")),
                ),
              )),
          new Expanded(
            flex: 3,
            child: new Column(
              children: <Widget>[
                new MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LevelQuiz()));
                  },
                  child: new Text(
                    "Main",
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  color: HexColor("#E74C3C"),
                  minWidth: SizeConfig.blockVertical = 155,
                  height: SizeConfig.blockHorizontal = 35,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                new MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LearnPages()));
                  },
                  child: new Text(
                    "Belajar",
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  color: HexColor("#E74C3C"),
                  minWidth: SizeConfig.blockVertical = 140,
                  height: SizeConfig.blockHorizontal = 30,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Integer {}
