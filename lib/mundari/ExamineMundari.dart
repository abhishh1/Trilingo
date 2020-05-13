import 'package:flutter/material.dart';
import 'package:trilingo/mundari/quiz/home.dart';


class ExaminePageMundari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      
    
   child: Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: QuizMundari(),
    );
  }
}
