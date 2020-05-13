import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceMundari {
  final String uid;

  DatabaseServiceMundari({this.uid});

  Future<void> addDataMundari(userData) async {
    Firestore.instance.collection("users").add(userData).catchError((e) {
      print(e);
    });
  }

  getDataMundari() async {
    return await Firestore.instance.collection("users").snapshots();
  }

  Future<void> addQuizDataMundari(Map quizData, String quizId) async {
    await Firestore.instance
        .collection("QuizMundari")
        .document(quizId)
        .setData(quizData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addQuestionDataMundari(quizData, String quizId) async {
    await Firestore.instance
        .collection("QuizMundari")
        .document(quizId)
        .collection("QNA")
        .add(quizData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizDataMundari() async {
    return await Firestore.instance.collection("QuizMundari").snapshots();
  }

  getQuestionDataMundari(String quizId) async{
    return await Firestore.instance
        .collection("QuizMundari")
        .document(quizId)
        .collection("QNA")
        .getDocuments();
  }
}