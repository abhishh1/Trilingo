import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:trilingo/mundari/HomePageMandari.dart';

class ResultsMundari extends StatefulWidget {
  final int total, correct, incorrect, notattempted;
  ResultsMundari({this.incorrect, this.total, this.correct, this.notattempted});

  @override
  _ResultsMundariState createState() => _ResultsMundariState();
}

class _ResultsMundariState extends State<ResultsMundari> {
  String congo = '';
  @override
  Widget build(BuildContext context) {
    if (widget.correct.toInt() > 4) {
      congo = 'Keep going!';
    }

    if (widget.correct.toInt() > 8) {
      congo = 'Awesome!';
    }

    if (widget.incorrect.toInt() < 4) {
      congo = 'Not bad!';
    }
    if (widget.incorrect.toInt() < 2) {
      congo = 'Try Again!';
    }
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text(
                  'Results',
                  style: TextStyle(decorationStyle: TextDecorationStyle.wavy,decorationThickness: 2.0,
                      fontFamily: 'Bee', fontSize: 30.0, color: Colors.brown),
                ),
              ),
              Text(
                "Score : ${widget.correct}/ ${widget.total}",
                style: TextStyle(fontSize: 25, fontFamily: 'Bee'),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Mastering Rate',
                      style: TextStyle(fontFamily: 'Bee'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: LinearPercentIndicator(
                        lineHeight: 15.0,
                        progressColor: Colors.deepOrangeAccent,
                        percent: widget.correct.toDouble() / widget.total.toDouble(),
                        backgroundColor: Colors.grey,
                        animateFromLastPercent: true,
                      ),
                    ),
                  ],
                ),
              ),Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Learning Rate',
                      style: TextStyle(fontFamily: 'Bee'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:5.0),
                      child: LinearPercentIndicator(
                        lineHeight: 15.0,
                        progressColor: Colors.deepOrangeAccent,
                        percent: widget.incorrect.toDouble() / widget.total.toDouble(),
                        backgroundColor: Colors.grey,
                        animateFromLastPercent: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: HomePageMundari(),
                            type: PageTransitionType.leftToRight));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                    ),
                    child: Text(
                      "Next Quiz",
                      style: TextStyle(
                          color: Colors.white, fontSize: 19, fontFamily: 'Bee'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  congo,
                  style: TextStyle(
                      color: Colors.lightBlueAccent, fontFamily: 'Bee', fontSize: 20.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
