import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:trilingo/mundari/lHomePageMandari.dart';

class CategoryPageMundari extends StatefulWidget {
  int passBack, passTotal;
  CategoryPageMundari({this.passBack, this.passTotal});
  @override
  _CategoryPageMundariState createState() => _CategoryPageMundariState();
}

class _CategoryPageMundariState extends State<CategoryPageMundari> {
  Future getPosts() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection('mandari').getDocuments();

    return qn.documents;
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPageMundari(
                  post: post,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        child: Icon(EvaIcons.homeOutline),
        backgroundColor: Colors.brown,
        onPressed: () {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  child: HomePageMundari(),
                  type: PageTransitionType.leftToRight));
        },
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: FutureBuilder(
          future: getPosts(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: SpinKitFadingFour(
                color: Colors.redAccent,
              ));
            } else {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 400.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.library_add),
                              title: Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Text(
                                  snapshot.data[index].data['name'],
                                  style: TextStyle(
                                      color: Colors.brown,
                                      fontSize: 20.0,
                                      fontFamily: 'Bee'),
                                ),
                              ),
                              subtitle: Text(
                                '${widget.passBack.toInt()} of 50 words completed',
                                style: TextStyle(fontFamily: 'Bee'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width - 50,
                                animation: true,
                                lineHeight: 20.0,
                                animationDuration: 2000,
                                percent: 0.0001 +
                                    (widget.passBack.toDouble() /
                                        widget.passTotal.toDouble()),
                                center: Text(
                                  widget.passBack.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontFamily: 'Bee'),
                                ),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Colors.brown,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 00.0),
                              child: MaterialButton(
                                onPressed: () =>
                                    navigateToDetail(snapshot.data[index]),
                                minWidth: 50,
                                height: 30.0,
                                color: Colors.deepOrangeAccent,
                                child: Text(
                                  'Study these words',
                                  style: TextStyle(
                                      fontFamily: 'Bee', color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        height: 170.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all()),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}

class DetailPageMundari extends StatefulWidget {
  final DocumentSnapshot post;
  DetailPageMundari({this.post});
  @override
  State<StatefulWidget> createState() => new _DetailPageMundariState();
}

class _DetailPageMundariState extends State<DetailPageMundari> {
  bool isSwitched = false;
  int next = 0;
  int checked = 0;
  int master = 0;
  int review = 0;
  int learning = 0;
  bool isChange = true;
  String completed = '';
  int total = 50;
  String completedButton = '';

  Future<bool> navigateToMain(int passBack, int passTotal) async {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryPageMundari(
                  passBack: passBack,
                  passTotal: passTotal,
                )));
  }

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
                          type: PageTransitionType.leftToRight));
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    String km = 'I knew the meaning';
    String dm = "I didn't knew the meaning";

    String w1 = widget.post.data['a1'];
    String w2 = widget.post.data['a2'];
    String w3 = widget.post.data['a3'];
    String w4 = widget.post.data['a4'];
    String w5 = widget.post.data['a5'];
    String w6 = widget.post.data['a6'];
    String w7 = widget.post.data['a7'];
    String w8 = widget.post.data['a8'];
    String w9 = widget.post.data['a9'];
    String w10 = widget.post.data['a10'];
    String w11 = widget.post.data['a11'];
    String w12 = widget.post.data['a12'];
    String w13 = widget.post.data['a13'];
    String w14 = widget.post.data['a14'];
    String w15 = widget.post.data['a15'];
    String w16 = widget.post.data['a16'];
    String w17 = widget.post.data['a17'];
    String w18 = widget.post.data['a18'];
    String w19 = widget.post.data['a19'];
    String w20 = widget.post.data['a20'];
    String w21 = widget.post.data['a21'];
    String w22 = widget.post.data['a22'];
    String w23 = widget.post.data['a23'];
    String w24 = widget.post.data['a24'];
    String w25 = widget.post.data['a25'];
    String w26 = widget.post.data['a26'];
    String w27 = widget.post.data['a27'];
    String w28 = widget.post.data['a28'];
    String w29 = widget.post.data['a29'];
    String w30 = widget.post.data['a30'];
    String w31 = widget.post.data['a31'];
    String w32 = widget.post.data['a32'];
    String w33 = widget.post.data['a33'];
    String w34 = widget.post.data['a34'];
    String w35 = widget.post.data['a35'];
    String w36 = widget.post.data['a36'];
    String w37 = widget.post.data['a37'];
    String w38 = widget.post.data['a38'];
    String w39 = widget.post.data['a39'];
    String w40 = widget.post.data['a40'];
    String w41 = widget.post.data['a41'];
    String w42 = widget.post.data['a42'];
    String w43 = widget.post.data['a43'];
    String w44 = widget.post.data['a44'];
    String w45 = widget.post.data['a45'];
    String w46 = widget.post.data['a46'];
    String w47 = widget.post.data['a47'];
    String w48 = widget.post.data['a48'];
    String w49 = widget.post.data['a49'];
    String w50 = widget.post.data['a50'];
    String m1 = widget.post.data['b1'];
    String m2 = widget.post.data['b2'];
    String m3 = widget.post.data['b3'];
    String m4 = widget.post.data['b4'];
    String m5 = widget.post.data['b5'];
    String m6 = widget.post.data['b6'];
    String m7 = widget.post.data['b7'];
    String m8 = widget.post.data['b8'];
    String m9 = widget.post.data['b9'];
    String m10 = widget.post.data['b10'];
    String m11 = widget.post.data['b11'];
    String m12 = widget.post.data['b12'];
    String m13 = widget.post.data['b13'];
    String m14 = widget.post.data['b14'];
    String m15 = widget.post.data['b15'];
    String m16 = widget.post.data['b16'];
    String m17 = widget.post.data['b17'];
    String m18 = widget.post.data['b18'];
    String m19 = widget.post.data['b19'];
    String m20 = widget.post.data['b20'];
    String m21 = widget.post.data['b21'];
    String m22 = widget.post.data['b22'];
    String m23 = widget.post.data['b23'];
    String m24 = widget.post.data['b24'];
    String m25 = widget.post.data['b25'];
    String m26 = widget.post.data['b26'];
    String m27 = widget.post.data['b27'];
    String m28 = widget.post.data['b28'];
    String m29 = widget.post.data['b29'];
    String m30 = widget.post.data['b30'];
    String m31 = widget.post.data['b31'];
    String m32 = widget.post.data['b32'];
    String m33 = widget.post.data['b33'];
    String m34 = widget.post.data['b34'];
    String m35 = widget.post.data['b35'];
    String m36 = widget.post.data['b36'];
    String m37 = widget.post.data['b37'];
    String m38 = widget.post.data['b38'];
    String m39 = widget.post.data['b39'];
    String m40 = widget.post.data['b40'];
    String m41 = widget.post.data['b41'];
    String m42 = widget.post.data['b42'];
    String m43 = widget.post.data['b43'];
    String m44 = widget.post.data['b44'];
    String m45 = widget.post.data['b45'];
    String m46 = widget.post.data['b46'];
    String m47 = widget.post.data['b47'];
    String m48 = widget.post.data['b48'];
    String m49 = widget.post.data['b49'];
    String m50 = widget.post.data['b50'];

    if (next.toInt() > 0) {
      w1 = w2;
      m1 = m2;
    }
    if (next.toInt() > 1) {
      w1 = w3;
      m1 = m3;
    }
    if (next.toInt() > 2) {
      w1 = w4;
      m1 = m4;
    }
    if (next.toInt() > 3) {
      w1 = w5;
      m1 = m5;
    }
    if (next.toInt() > 4) {
      w1 = w6;
      m1 = m6;
    }
    if (next.toInt() > 5) {
      w1 = w7;
      m1 = m7;
    }
    if (next.toInt() > 6) {
      w1 = w8;
      m1 = m8;
    }
    if (next.toInt() > 7) {
      w1 = w9;
      m1 = m9;
    }
    if (next.toInt() > 8) {
      w1 = w10;
      m1 = m10;
    }
    if (next.toInt() > 9) {
      w1 = w11;
      m1 = m11;
    }
    if (next.toInt() > 10) {
      w1 = w12;
      m1 = m12;
    }
    if (next.toInt() > 11) {
      w1 = w13;
      m1 = m13;
    }
    if (next.toInt() > 12) {
      w1 = w14;
      m1 = m14;
    }
    if (next.toInt() > 13) {
      w1 = w15;
      m1 = m15;
    }
    if (next.toInt() > 14) {
      w1 = w16;
      m1 = m16;
    }
    if (next.toInt() > 15) {
      w1 = w17;
      m1 = m17;
    }
    if (next.toInt() > 16) {
      w1 = w18;
      m1 = m18;
    }

    if (next.toInt() > 17) {
      w1 = w19;
      m1 = m19;
    }
    if (next.toInt() > 18) {
      w1 = w20;
      m1 = m20;
    }
    if (next.toInt() > 19) {
      w1 = w21;
      m1 = m21;
    }
    if (next.toInt() > 20) {
      w1 = w22;
      m1 = m22;
    }
    if (next.toInt() > 21) {
      w1 = w23;
      m1 = m23;
    }
    if (next.toInt() > 22) {
      w1 = w24;
      m1 = m24;
    }
    if (next.toInt() > 23) {
      w1 = w25;
      m1 = m25;
    }
    if (next.toInt() > 24) {
      w1 = w26;
      m1 = m26;
    }
    if (next.toInt() > 25) {
      w1 = w27;
      m1 = m27;
    }
    if (next.toInt() > 26) {
      w1 = w28;
      m1 = m28;
    }
    if (next.toInt() > 27) {
      w1 = w29;
      m1 = m29;
    }
    if (next.toInt() > 28) {
      w1 = w30;
      m1 = m30;
    }
    if (next.toInt() > 29) {
      w1 = w31;
      m1 = m31;
    }
    if (next.toInt() > 30) {
      w1 = w32;
      m1 = m32;
    }
    if (next.toInt() > 31) {
      w1 = w33;
      m1 = m33;
    }
    if (next.toInt() > 32) {
      w1 = w34;
      m1 = m34;
    }
    if (next.toInt() > 33) {
      w1 = w35;
      m1 = m35;
    }
    if (next.toInt() > 34) {
      w1 = w37;
      m1 = m37;
    }
    if (next.toInt() > 35) {
      w1 = w38;
      m1 = m38;
    }
    /*if (next.toInt() > 36) {
      w1 = w39;
      m1 = m39;
    }*/
    if (next.toInt() > 37) {
      w1 = w40;
      m1 = m40;
    }
    if (next.toInt() > 38) {
      w1 = w41;
      m1 = m42;
    }
    if (next.toInt() > 39) {
      w1 = w43;
      m1 = m43;
    }
    if (next.toInt() > 40) {
      w1 = w44;
      m1 = m44;
    }
    if (next.toInt() > 41) {
      w1 = w45;
      m1 = m45;
    }

    if (next.toInt() > 42) {
      w1 = w46;
      m1 = m46;
    }
    if (next.toInt() > 43) {
      w1 = w47;
      m1 = m47;
    }
    if (next.toInt() > 44) {
      w1 = w48;
      m1 = m48;
    }
    if (next.toInt() > 45) {
      w1 = w49;
      m1 = m49;
    }
    if (next.toInt() > 46) {
      w1 = w50;
      m1 = m50;
    }
    if (next.toInt() > 46) {
      w1 = w36;
      m1 = m36;
    }
    if (next.toInt() > 46) {
      w1 = w41;
      m1 = m41;
    }
    if (next.toInt() > 47) {
      w1 = w42;
      m1 = m42;
    }

    if (next.toInt() > 49) {
      completed = 'Hurray! Learning completed';
      completedButton = 'Tap to Examine';
    }

    if (master.toInt() > 49 || learning.toInt() > 49) {
      return HomePageMundari();
    }

    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (isChange = true) {
                next++;
              }
            });
          },
          backgroundColor: Colors.brown,
          child: Icon(FontAwesomeIcons.play),
        ),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(EvaIcons.arrowIosDownward),
              onPressed: () => navigateToMain(master, total)),
          title: Text(
            'Learn',
            style: TextStyle(fontFamily: 'Bee', color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  height: 200.0,
                  width: 340.0,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.black, width: 1.0)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0),
                          child: Text(
                            w1,
                            style: TextStyle(fontFamily: 'Bee', fontSize: 20.0),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print('meow');
                          },
                          icon: Icon(
                            Icons.mic,
                            color: Colors.brown,
                          ),
                        ),
                        MaterialButton(
                          minWidth: 50.0,
                          color: Colors.brown,
                          onPressed: () {},
                          child: Text(
                            m1,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Bee',
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 6.0),
                      child: MaterialButton(
                        color: Colors.orange,
                        onPressed: () {
                          setState(() {
                            master++;
                          });
                        },
                        child: Text(
                          km,
                          style: TextStyle(fontFamily: 'Bee'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: MaterialButton(
                        color: Colors.orange,
                        onPressed: () {
                          setState(() {
                            learning++;
                          });
                        },
                        child: Text(
                          dm,
                          style: TextStyle(fontFamily: 'Bee'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  color: Colors.orange,
                  child: Text(
                    'Add to review',
                    style: TextStyle(fontFamily: 'Bee'),
                  ),
                  onPressed: () {
                    setState(() {
                      review++;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: SizedBox(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'You have mastered ${master.toInt()} words',
                        style: TextStyle(fontFamily: 'Bee'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: LinearPercentIndicator(
                          lineHeight: 15.0,
                          progressColor: Colors.green,
                          percent: master.toDouble() / 50,
                          backgroundColor: Colors.grey,
                          animateFromLastPercent: true,
                        ),
                      ),
                      Text(
                        'You have learned ${learning.toInt()} words',
                        style: TextStyle(fontFamily: 'Bee'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: LinearPercentIndicator(
                          lineHeight: 15.0,
                          progressColor: Colors.blueAccent,
                          percent: learning.toDouble() / 50,
                          backgroundColor: Colors.grey,
                          animateFromLastPercent: true,
                        ),
                      ),
                      Text(
                        'You have reviewed ${review.toInt()} words',
                        style: TextStyle(fontFamily: 'Bee'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: LinearPercentIndicator(
                          lineHeight: 15.0,
                          progressColor: Colors.brown,
                          percent: review.toDouble() / 50,
                          backgroundColor: Colors.grey,
                          animateFromLastPercent: true,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SizedBox(
                  width: 220.0,
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    completed,
                    style: TextStyle(fontFamily: 'Bee'),
                  ),
                  FlatButton(
                    child: Text(
                      completedButton,
                      style: TextStyle(fontFamily: 'Bee'),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: HomePageMundari(),
                              type: PageTransitionType.upToDown));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
