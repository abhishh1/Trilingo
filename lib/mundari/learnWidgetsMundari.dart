import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';


import 'package:trilingo/authentication/signUpPage.dart';

class LearnWidgetsMundari extends StatefulWidget {
  @override
  _LearnWidgetsMundariState createState() => _LearnWidgetsMundariState();
}

class _LearnWidgetsMundariState extends State<LearnWidgetsMundari> {
  @override
  Widget build(BuildContext context) {
  

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/top1.jpg'), fit: BoxFit.cover),
        border: Border.all(width: 1.0, color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: RichText(
              text: TextSpan(
                text: 'Create a free ',
                style: TextStyle(
                    fontFamily: 'Bee',
                    color: Colors.deepOrangeAccent,
                    fontSize: 14.0),
                children: <TextSpan>[
                  TextSpan(
                      text: 'account ',
                      style: TextStyle(color: Colors.lightBlueAccent)),
                  TextSpan(
                      text: 'to see your progress. ',
                      style: TextStyle(color: Colors.deepOrangeAccent)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: RichText(
              text: TextSpan(
                text: 'It takes less than',
                style: TextStyle(
                    fontFamily: 'Bee', color: Colors.white, fontSize: 14.0),
                children: <TextSpan>[
                  TextSpan(
                      text: ' 60 seconds ',
                      style: TextStyle(color: Colors.yellowAccent)),
                  TextSpan(
                      text: 'to join the commmunity! ',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              width: 50.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: Row(
              children: <Widget>[
                MaterialButton(
                  onPressed: (){}, //=> loginBottom(),
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    'Log in',
                    style: TextStyle(fontFamily: 'Bee'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: RegisterForm(),
                              type: PageTransitionType.rightToLeft));
                    },
                    color: Colors.lightBlueAccent,
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontFamily: 'Bee'),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
