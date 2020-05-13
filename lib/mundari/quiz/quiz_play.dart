import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trilingo/mundari/HomePageMandari.dart';
import 'package:trilingo/mundari/quiz/database.dart';
import 'package:trilingo/mundari/quiz/question_model.dart';
import 'package:trilingo/mundari/quiz/quiz_play_widgets.dart';
import 'package:trilingo/mundari/quiz/results.dart';

class QuizPlayMundari extends StatefulWidget {
  final String quizId;
  QuizPlayMundari(this.quizId);

  @override
  _QuizPlayMundariState createState() => _QuizPlayMundariState();
}

int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;
int total = 0;

/// Stream
Stream infoStream;

class _QuizPlayMundariState extends State<QuizPlayMundari> {
  QuerySnapshot questionSnaphot;
  DatabaseServiceMundari databaseService = new DatabaseServiceMundari();
  bool isLoading = true;
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Back to home?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: HomePageMundari(),
                          type: PageTransitionType.rightToLeft));
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  void initState() {
    databaseService.getQuestionDataMundari(widget.quizId).then((value) {
      questionSnaphot = value;
      _notAttempted = questionSnaphot.documents.length;
      _correct = 0;
      _incorrect = 0;
      isLoading = false;
      total = questionSnaphot.documents.length;
      setState(() {});
      print("init don $total ${widget.quizId} ");
    });

    if (infoStream == null) {
      infoStream = Stream<List<int>>.periodic(Duration(milliseconds: 100), (x) {
        print("this is  $x");
        return [_correct, _incorrect];
      });
    }

    super.initState();
  }

  QuestionModelMundari getQuestionModelFromDatasnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModelMundari questionModel = new QuestionModelMundari();

    questionModel.question = questionSnapshot.data["question"];

    /// shuffling the options
    List<String> options = [
      questionSnapshot.data["option1"],
      questionSnapshot.data["option2"],
      questionSnapshot.data["option3"],
      questionSnapshot.data["option4"]
    ];
    options.shuffle();

    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctOption = questionSnapshot.data["option1"];
    questionModel.answered = false;

    print(questionModel.correctOption.toLowerCase());

    return questionModel;
  }

  @override
  void dispose() {
    infoStream = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.brown,
            child: Icon(EvaIcons.monitor),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: ResultsMundari(
                        correct: _correct,
                        incorrect: _incorrect,
                        total: total,
                      ),
                      type: PageTransitionType.rightToLeft));
            }),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(EvaIcons.arrowIosBackOutline),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: HomePageMundari(),
                      type: PageTransitionType.rightToLeft));
            },
          ),
          title: Text(
            'Examine',
            style: TextStyle(fontFamily: 'Bee', color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          brightness: Brightness.light,
          elevation: 0.0,
        ),
        body: isLoading
            ? Container(
                child: Center(
                    child: SpinKitChasingDots(
                  color: Colors.red,
                )),
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              height: 70.0,
                              child: InfoHeaderMundari(
                                length: questionSnaphot.documents.length,
                              ),
                            ),
                          ),
                          questionSnaphot.documents == null
                              ? Container(
                                  child: Center(
                                    child: Text(
                                      "No Data",
                                      style: TextStyle(fontFamily: 'Bee'),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: questionSnaphot.documents.length,
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return QuizPlayTileMundari(
                                      questionModel:
                                          getQuestionModelFromDatasnapshot(
                                              questionSnaphot.documents[index]),
                                      index: index,
                                    );
                                  })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class InfoHeaderMundari extends StatefulWidget {
  final int length;

  InfoHeaderMundari({@required this.length});

  @override
  _InfoHeaderMundariState createState() => _InfoHeaderMundariState();
}

class _InfoHeaderMundariState extends State<InfoHeaderMundari> {
  TextStyle style;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: infoStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  children: <Widget>[
                    Container(
                      height: 40,
                      margin: EdgeInsets.only(left: 14),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: <Widget>[
                          NoOfQuestionTileMundari(
                            text: "Total",
                            number: widget.length,
                          ),
                          NoOfQuestionTileMundari(
                            text: "Master",
                            number: _correct,
                          ),
                          NoOfQuestionTileMundari(
                            text: "Learning",
                            number: _incorrect,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container();
        });
  }
}

class QuizPlayTileMundari extends StatefulWidget {
  final QuestionModelMundari questionModel;
  final int index;

  QuizPlayTileMundari({@required this.questionModel, @required this.index});

  @override
  _QuizPlayTileMundariState createState() => _QuizPlayTileMundariState();
}

class _QuizPlayTileMundariState extends State<QuizPlayTileMundari> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Q${widget.index + 1} ${widget.questionModel.question}",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.8),
                  fontFamily: 'Bee'),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option1 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTileMundari(
              option: "A",
              description: "${widget.questionModel.option1}",
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option2 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTileMundari(
              option: "B",
              description: "${widget.questionModel.option2}",
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option3 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTileMundari(
              option: "C",
              description: "${widget.questionModel.option3}",
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          GestureDetector(
            onTap: () {
              if (!widget.questionModel.answered) {
                ///correct
                if (widget.questionModel.option4 ==
                    widget.questionModel.correctOption) {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted + 1;
                  });
                } else {
                  setState(() {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _incorrect = _incorrect + 1;
                    _notAttempted = _notAttempted - 1;
                  });
                }
              }
            },
            child: OptionTileMundari(
              option: "D",
              description: "${widget.questionModel.option4}",
              correctAnswer: widget.questionModel.correctOption,
              optionSelected: optionSelected,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
