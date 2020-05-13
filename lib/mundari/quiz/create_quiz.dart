import 'package:flutter/material.dart';
import 'package:trilingo/mundari/quiz/add_question.dart';
import 'package:trilingo/mundari/quiz/database.dart';
import 'package:random_string/random_string.dart';

class CreateQuizMundari extends StatefulWidget {
  @override
  _CreateQuizMundariState createState() => _CreateQuizMundariState();
}

class _CreateQuizMundariState extends State<CreateQuizMundari> {
  DatabaseServiceMundari databaseService = new DatabaseServiceMundari();
  final _formKey = GlobalKey<FormState>();

  String quizImgUrl, quizTitle, quizDesc;

  bool isLoading = false;
  String quizId;

  createQuizMundari() {
    quizId = randomAlphaNumeric(16);
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> quizData = {
        "quizId": quizId,
        "quizImgUrl": quizImgUrl,
        "quizTitle": quizTitle,
        "quizDesc": quizDesc
      };

      databaseService.addQuizDataMundari(quizData, quizId).then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AddQuestionMundari(quizId)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: Text(
          'Create Quiz',
          style: TextStyle(fontFamily: 'Bee'),
        ),
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
        //brightness: Brightness.li,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              TextFormField(
                style: TextStyle(fontFamily: 'Bee'),
                validator: (val) => val.isEmpty ? "Enter Quiz Title" : null,
                decoration: InputDecoration(
                    hintText: "Quiz Title",
                    hintStyle: TextStyle(fontFamily: 'Bee')),
                onChanged: (val) {
                  quizTitle = val;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(style: TextStyle(fontFamily: 'Bee'),
                validator: (val) =>
                    val.isEmpty ? "Enter Quiz Description" : null,
                decoration: InputDecoration(
                    hintText: "Quiz Description",
                    hintStyle: TextStyle(fontFamily: 'Bee')),
                onChanged: (val) {
                  quizDesc = val;
                },
              ),
              // Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: GestureDetector(
                  onTap: () {
                    createQuizMundari();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Create Quiz",
                      style: TextStyle(
                          fontSize: 16, color: Colors.white, fontFamily: 'Bee'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
