import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trilingo/authentication/Auth.dart';
import 'package:trilingo/authentication/GoogleSignIn.dart';
import 'package:trilingo/authentication/loginPage.dart';
import 'package:trilingo/mundari/ExamineMundari.dart';
import 'package:trilingo/mundari/learnMundari.dart';

class HomePageMundari extends StatefulWidget {
  GoogleSignIn googleSignIn;
  FirebaseUser user;
  int passBack, passTotal;
  HomePageMundari(
      {this.googleSignIn, this.user, this.passBack, this.passTotal});
  @override
  _HomePageMundariState createState() => _HomePageMundariState();
}

class _HomePageMundariState extends State<HomePageMundari> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Exit Trilingo?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  MyGoogleApp googleApp = MyGoogleApp();
  bool isSwitched = false;
  final AuthService _authService = AuthService();
  int checked = 0;
  String engTitle = 'Home';
  String tab1eng = 'learn';
  String tab2eng = 'Examine';
  int pressed = 0;
  String blank = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                leading: MaterialButton(
                    onPressed: () {
                      setState(() {
                        // pressed++;
                      });
                    },
                    child: Icon(EvaIcons.checkmarkCircle2Outline)),
                backgroundColor: Colors.deepOrange,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        tab1eng,
                        style: TextStyle(fontFamily: 'Bee', fontSize: 18.0),
                      ),
                    ),
                    Tab(
                      child: Text(
                        tab2eng,
                        style: TextStyle(fontFamily: 'Bee', fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
                title: Text(
                  engTitle,
                  style: TextStyle(
                      fontFamily: 'Bee', color: Colors.white, fontSize: 22.0),
                ),
              ),
              endDrawer: Container(
                width: 140.0,
                child: Drawer(
                  elevation: 16.0,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 850.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/draw.jpg'),
                                fit: BoxFit.fitHeight)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 00.0, top: 70),
                              child: Row(
                                children: <Widget>[
                                  MaterialButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          PageTransition(
                                              child: HomePageMundari(),
                                              type: PageTransitionType
                                                  .leftToRight));
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /*Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 30),
                              child: CircleAvatar(
                                radius: 40.0,
                                backgroundColor: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                              child: Text(
                                'Hey , Abhishek',
                                style: TextStyle(fontFamily: 'Bee'),
                              ),
                            ),*/
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: MaterialButton(
                                  color: Colors.deepOrange,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            child: HomePageMundari(),
                                            type: PageTransitionType
                                                .leftToRight));
                                  },
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                        fontFamily: 'Bee',
                                        fontSize: 20.0,
                                        color: Colors.white),
                                  )),
                            ),
                            SizedBox(
                              width: 100.0,
                              child: Divider(
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: MaterialButton(
                                  color: Colors.deepOrange,
                                  onPressed: () {},
                                  child: Text(
                                    'About',
                                    style: TextStyle(
                                        fontFamily: 'Bee',
                                        fontSize: 20.0,
                                        color: Colors.white),
                                  )),
                            ),
                            SizedBox(
                              width: 100.0,
                              child: Divider(
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 100.0),
                              child: SizedBox(
                                width: 100.0,
                                child: Divider(color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 00.0),
                              child: MaterialButton(
                                  color: Colors.deepOrange,
                                  onPressed: () {
                                    _authService.signOut();
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: SignInForm(),
                                            type: PageTransitionType.upToDown));
                                  },
                                  child: Text(
                                    'Log out',
                                    style: TextStyle(
                                        fontFamily: 'Bee',
                                        fontSize: 20.0,
                                        color: Colors.white),
                                  )),
                            ),
                            SizedBox(
                              width: 100.0,
                              child: Divider(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  LearnPageMundari(
                    passTotal: checked,
                    passBack: pressed,
                  ),
                  ExaminePageMundari()
                ],
              ),
            ),
          ),
        ));
  }
}
