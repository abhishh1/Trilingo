import 'package:flutter/material.dart';
import 'package:trilingo/mundari/quiz/database.dart';


class AddQuestionMundari extends StatefulWidget {
  final String quizId;
  AddQuestionMundari(this.quizId);

  @override
  _AddQuestionMundariState createState() => _AddQuestionMundariState();
}

class _AddQuestionMundariState extends State<AddQuestionMundari> {
  DatabaseServiceMundari databaseService = new DatabaseServiceMundari();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String question = "", option1 = "", option2 = "", option3 = "", option4 = "";

  uploadQuizDataMundari() {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      print("${widget.quizId}");
      databaseService.addQuestionDataMundari(questionMap, widget.quizId).then((value) {
        question = "";
        option1 = "";
        option2 = "";
        option3 = "";
        option4 = "";
        setState(() {
          isLoading = false;
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print("error is happening ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black54,
        ),
        //title: AppLogo(),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        //brightness: Brightness.li,
      ),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(fontFamily: 'Bee'),
                      validator: (val) => val.isEmpty ? "Enter Question" : null,
                      decoration: InputDecoration(
                          hintText: "Question",
                          hintStyle: TextStyle(fontFamily: 'Bee')),
                      onChanged: (val) {
                        question = val;
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      style: TextStyle(fontFamily: 'Bee'),
                      validator: (val) => val.isEmpty ? "Option1 " : null,
                      decoration: InputDecoration(
                          hintText: "Option1 (Correct Answer)",
                          hintStyle: TextStyle(fontFamily: 'Bee')),
                      onChanged: (val) {
                        option1 = val;
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      style: TextStyle(fontFamily: 'Bee'),
                      validator: (val) => val.isEmpty ? "Option2 " : null,
                      decoration: InputDecoration(
                          hintText: "Option2",
                          hintStyle: TextStyle(fontFamily: 'Bee')),
                      onChanged: (val) {
                        option2 = val;
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      style: TextStyle(fontFamily: 'Bee'),
                      validator: (val) => val.isEmpty ? "Option3 " : null,
                      decoration: InputDecoration(
                          hintText: "Option3",
                          hintStyle: TextStyle(fontFamily: 'Bee')),
                      onChanged: (val) {
                        option3 = val;
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      style: TextStyle(fontFamily: 'Bee'),
                      validator: (val) => val.isEmpty ? "Option4 " : null,
                      decoration: InputDecoration(
                          hintText: "Option4",
                          hintStyle: TextStyle(fontFamily: 'Bee')),
                      onChanged: (val) {
                        option4 = val;
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: 'Bee'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            uploadQuizDataMundari();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Add Question",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
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
