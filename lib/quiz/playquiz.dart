import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Quiztoria/layout.dart';
import 'package:Quiztoria/quiz/resultquiz.dart';
import 'package:Quiztoria/splash_screen.dart';

class jsonFile extends StatelessWidget {
  String theory;
  String loadAsset;
  jsonFile(this.theory);
  replaceAsset() {
    if (theory == "Sejarah") {
      loadAsset = "assets/materi1.json";
    } else if (theory == "Praaksara") {
      loadAsset = "assets/materi2.json";
    } else if (theory == "Kerajaan") {
      loadAsset = "assets/materi3.json";
    } else if (theory == "Peradaban") {
      loadAsset = "assets/materi4.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    replaceAsset();
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString(loadAsset, cache: true),
        builder: (context, snapshot) {
          List quizData = json.decode(snapshot.data.toString());
          if (quizData == null) {
            return Scaffold(
              body: Center(
                  child: new Text(
                "Tunggu sebentar :D",
                style: TextStyle(
                  fontFamily: "Roboto",
                ),
              )),
            );
          } else {
            return PlayQuiz(quizData: quizData);
          }
        });
  }
}

class PlayQuiz extends StatefulWidget {
  var quizData;
  PlayQuiz({Key key, @required this.quizData});
  @override
  _PlayQuizState createState() => _PlayQuizState(quizData);
}

class _PlayQuizState extends State<PlayQuiz> {
  var quizData;
  _PlayQuizState(this.quizData);
  Color showColor = Colors.white70;
  int score = 0, i = 1, j = 1, countQuestion = 0, timer = 15;
  double visibleAnsTxt;
  String showTimer = "15", correctAnswerTxt;
  bool timerOff = false;
  Map<String, Color> buttonColor = {
    "a": Colors.white70,
    "b": Colors.white70,
    "c": Colors.white70,
    "d": Colors.white70,
  };
  bool _isButtonEnabled;

  var list_quiz = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    startTimer();
    _isButtonEnabled = false;
    visibleAnsTxt = 0.0;
    super.initState();
  }

  @override
  void setState(x) {
    if (mounted) {
      super.setState(x);
    }
  }

  void startTimer() async {
    const second = Duration(seconds: 1);
    Timer.periodic(second, (Timer time) {
      setState(() {
        if (timer < 1) {
          time.cancel();
          nextQuestion();
        } else if (timerOff == true) {
          time.cancel();
        } else {
          timer = timer - 1;
        }
        showTimer = timer.toString();
      });
    });
  }

  void nextQuestion() {
    _isButtonEnabled = false;
    visibleAnsTxt = 0.0;
    timerOff = false;
    timer = 15;
    setState(() {
      if (j < 10) {
        i = list_quiz[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                ResultQuiz(score: score, countQuestion: countQuestion)));
      }
    });
    startTimer();
    buttonColor["a"] = Colors.white70;
    buttonColor["b"] = Colors.white70;
    buttonColor["c"] = Colors.white70;
    buttonColor["d"] = Colors.white70;
  }

  void checkAnswer(String correctAnswer) {
    if (quizData[2][i.toString()] == quizData[1][i.toString()][correctAnswer]) {
      score = score + 10;
      countQuestion++;
      showColor = Colors.green;
    } else {
      showColor = Colors.red;
    }
    setState(() {
      visibleAnsTxt = 1.0;
      buttonColor[correctAnswer] = showColor;
      timerOff = true;
      _isButtonEnabled = true;
    });
    Timer(Duration(seconds: 2), nextQuestion);
    setState(() {});
  }

  Widget answerButton(String correctAnswer) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        child: SizedBox(
          width: double.infinity,
          child: OutlineButton(
            onPressed:
                _isButtonEnabled ? null : () => checkAnswer(correctAnswer),
            child: new Text(
              quizData[1][i.toString()][correctAnswer],
              style: TextStyle(
                fontFamily: "Roboto",
                color: buttonColor[correctAnswer],
              ),
              maxLines: 1,
            ),
            borderSide: BorderSide(
              color: buttonColor[correctAnswer],
              style: BorderStyle.solid,
              width: 3.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Quiztoria"),
                  content: Text("Apakah kamu ingin keluar?"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: Text(
                          "Ya",
                          style: TextStyle(color: Colors.green),
                        )),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Tidak",
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ));
      },
      child: Scaffold(
        backgroundColor: HexColor("#E74C3C"),
        body: new Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            new Text(
                              "Waktu: ",
                              style: TextStyle(
                                fontSize: SizeConfig.blockVertical = 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            new Text(showTimer),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            new Text(
                              "Score: ",
                              style: TextStyle(
                                fontSize: SizeConfig.blockVertical = 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            new Text(score.toString()),
                          ],
                        ),
                      ],
                    ))),
            Expanded(
              flex: 3,
              child: new Container(
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(15.0),
                    color: Colors.white),
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 14.0),
                alignment: FractionalOffset.center,
                child: new Text(
                  quizData[0][i.toString()],
                  style: TextStyle(
                    fontSize: SizeConfig.blockVertical = 15,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Opacity(
                  opacity: visibleAnsTxt,
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    alignment: FractionalOffset.center,
                    child: new Text(
                      quizData[2][i.toString()],
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: SizeConfig.blockVertical = 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Expanded(
                flex: 6,
                child: new Container(
                    child: new Container(
                        margin: EdgeInsets.only(top: 14.0),
                        decoration: BoxDecoration(
                            color: HexColor("#2D3436"),
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(30),
                              topEnd: Radius.circular(30),
                            )),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            answerButton('a'),
                            answerButton('b'),
                            answerButton('c'),
                            answerButton('d'),
                          ],
                        )))),
          ],
        ),
      ),
    );
  }
}
