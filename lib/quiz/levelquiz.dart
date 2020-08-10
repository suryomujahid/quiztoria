import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Quiztoria/layout.dart';
import 'package:Quiztoria/splash_screen.dart';
import 'package:Quiztoria/playquiz.dart';
import 'package:Quiztoria/homepages.dart';

class LevelQuiz extends StatefulWidget {
  LevelQuiz({Key key}) : super(key: key);

  @override
  _LevelQuizState createState() => _LevelQuizState();
}

class _LevelQuizState extends State<LevelQuiz> {
  Widget levelCard({String theory, String images, String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
          width: SizeConfig.blockHorizontal = 150,
          height: SizeConfig.blockVertical = 150,
          decoration: new BoxDecoration(
            borderRadius:
                new BorderRadius.horizontal(left: const Radius.circular(8.0)),
            color: Colors.white,
          ),
          child: Image(
            image: AssetImage(images),
          ),
        ),
        Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(bottom: 5.0, top: 5.0),
            width: SizeConfig.blockHorizontal = 170,
            height: SizeConfig.blockVertical = 140,
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.horizontal(
                  right: const Radius.circular(8.0)),
              color: HexColor("#E74C3C"),
            ),
            child: Wrap(alignment: WrapAlignment.center, children: [
              new Container(
                padding: EdgeInsets.only(top: 40.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: SizeConfig.blockHorizontal = 15,
                    fontFamily: "Roboto",
                    color: Colors.white,
                  ),
                ),
              ),
              new MaterialButton(
                color: HexColor("#00E640"),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => jsonFile(theory)));
                },
                minWidth: SizeConfig.blockVertical = 140,
                height: SizeConfig.blockHorizontal = 30,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                child: new Text(
                  "Mulai",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ])),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#2D3436"),
          title: new Text(
            "Pilih Materi",
            style: TextStyle(
              fontFamily: "Roboto",
            ),
          ),
        ),
        backgroundColor: HexColor("#2D3436"),
        body: Center(
          child: ListView(
          physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    levelCard(
                        theory: "Sejarah",
                        images: "images/delivery.png",
                        title: "Pengantar Ilmu Sejarah"),
                    levelCard(
                        theory: "Praaksara",
                        images: "images/ancient.png",
                        title: "Masa Praaksara"),
                    levelCard(
                        theory: "Kerajaan",
                        images: "images/mosque.jpg",
                        title: "Kerajaan Islam Di Indonesia"),
                    levelCard(
                        theory: "Peradaban",
                        images: "images/timeline.png",
                        title: "Peradaban Islam Di Indonesia"),
                  ],
        )
        )
    );
  }
}
