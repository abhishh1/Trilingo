import 'package:flutter/material.dart';
import 'package:trilingo/mundari/quiz/database.dart';
import 'package:trilingo/mundari/quiz/quiz_play.dart';

class QuizMundari extends StatefulWidget {
  @override
  _QuizMundariState createState() => _QuizMundariState();
}

class _QuizMundariState extends State<QuizMundari> {
  Stream quizStreamMundari;
  DatabaseServiceMundari databaseService = new DatabaseServiceMundari();

  Widget quizListMundari() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              child: StreamBuilder(
            stream: quizStreamMundari,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return QuizTileMundari(
                          noOfQuestions: snapshot.data.documents.length,
                          imageUrl:
                              snapshot.data.documents[index].data['quizImgUrl'],
                          title:
                              snapshot.data.documents[index].data['quizTitle'],
                          description:
                              snapshot.data.documents[index].data['quizDesc'],
                          quizid: snapshot.data.documents[index].data["quizId"],
                        );
                      });
            },
          )),
        ],
      ),
    );
  }

//============================================================================================
  @override
  void initState() {
    databaseService.getQuizDataMundari().then((value) {
      quizStreamMundari = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: quizListMundari(),
      /*floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.perm_identity,
          color: Colors.redAccent,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuizMundari()));
        },
      ),*/
    );
  }
}

class QuizTileMundari extends StatelessWidget {
  final String imageUrl, title, quizid, description;
  final int noOfQuestions;

  QuizTileMundari(
      {@required this.title,
      @required this.imageUrl,
      @required this.description,
      @required this.quizid,
      @required this.noOfQuestions});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QuizPlayMundari(quizid)));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Image.asset(
                        'images/ss1.jpg',
                        colorBlendMode: BlendMode.darken,
                        color: Colors.black54,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        color: Colors.black26,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontFamily: 'Bee',
                                  fontSize: 30.0,
                                  color: Colors.deepOrangeAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                description,
                                style: TextStyle(
                                    fontFamily: 'Bee',
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
