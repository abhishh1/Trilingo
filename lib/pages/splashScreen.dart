import 'dart:async';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trilingo/authentication/loginPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 2),
        () => {
              Navigator.push(
                  context,
                  PageTransition(
                      child: SignInForm(), type: PageTransitionType.downToUp))
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/ss.jpg'), fit: BoxFit.fitWidth)),
          child: Center(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 250.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Tri',
                      style: TextStyle(
                          fontFamily: 'Rockdiz',
                          color: Colors.brown,
                          fontSize: 50.0),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'lin',
                            style:
                                TextStyle(color: Colors.green, fontSize: 50.0)),
                        TextSpan(
                            text: 'go',
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 50.0)),
                      ],
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 160.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'A way to ',
                      style: TextStyle(
                          fontFamily: 'Bee',
                          color: Colors.brown,
                          fontSize: 20.0),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'connect ',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 20.0)),
                        TextSpan(
                            text: 'different cultures ',
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 20.0)),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: SpinKitWave(
                  color: Colors.deepOrangeAccent,
                  size: 50.0,
                ),
              )
            ],
          )),
        ));
  }
}
