import 'package:flutter/material.dart';
import 'package:Quiztoria/homepages.dart';
import 'package:Quiztoria/layout.dart';
import 'package:Quiztoria/playquiz.dart';
import 'package:Quiztoria/splash_screen.dart';

class ResultQuiz extends StatefulWidget {
  int score;
  int countQuestion;
  ResultQuiz({Key key, @required this.score, this.countQuestion})
      : super(key: key);

  @override
  _ResultQuizState createState() => _ResultQuizState(score, countQuestion);
}

class _ResultQuizState extends State<ResultQuiz> {
  String msg;
  int score;
  int countQuestion;

  _ResultQuizState(this.score, this.countQuestion);

  @override
  void initState() {
    if (score >= 85) {
      msg = "Mantap jiwa, dapat nilai sempurna! ";
    } else if (score >= 80) {
      msg = "Score kamu melampaui beberapa orang!";
    } else if (score >= 75) {
      msg = "Nilai kamu merupakan standar, selamat!";
    } else {
      msg = "Yahh kurang, ayo coba lagi!";
    }
    super.initState();
  }

  Widget rowText(String title, String value, Color textcolor) {
       
      return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Text(title, style: TextStyle(
        fontFamily: "Roboto",
        fontSize: SizeConfig.blockVertical = 20,
        fontWeight: FontWeight.bold,
      ),),
      Text(value, style: TextStyle(
        fontFamily: "Roboto",
        fontSize: SizeConfig.blockVertical = 18,
        color: textcolor
      ),)
    ],);
  }

  @override
  Widget build(BuildContext context) {
    int wrongAnswer = 10 - countQuestion;
    return Scaffold(
        backgroundColor: HexColor("#2D3436"),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20.0,left:20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                width: SizeConfig.blockVertical = 350,
                height: SizeConfig.blockHorizontal = 150,
                margin: EdgeInsets.all(10.0),
                child: Center(
                    child: SingleChildScrollView(
                  child: new Column(
                    children: <Widget>[
                      
                      Text("~Hasil~", style: TextStyle(fontFamily: "Raleway", fontSize: SizeConfig.blockVertical = 16),),
                      Text(msg,style: TextStyle(fontFamily: "Raleway", fontSize: SizeConfig.blockVertical = 14, color: Colors.yellow[800]),),
                      rowText("Skor                  ", score.toString(), Colors.green ),
                      rowText("Jawaban Benar", countQuestion.toString(), Colors.green ),
                      rowText("Jawaban Salah", wrongAnswer.toString(), Colors.red ),
                    ],
                  ),
                ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomePages()));
                  },
                  minWidth: SizeConfig.blockVertical = 350,
                   height: SizeConfig.blockHorizontal = 40,
                  color: HexColor("#E74C3C"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: new Text(
                    "Kembali ke Main Menu",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
