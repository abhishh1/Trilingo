import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trilingo/authentication/loginPage.dart';
import 'package:trilingo/mundari/HomePageMandari.dart';

class InstructionPage extends StatefulWidget {
  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  @override
  Widget build(BuildContext context) {
    update() {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(color: Colors.orange),
              height: 50.0,
              child: Center(
                  child: Text(
                "Shall be updated soon.Let's Learn Mundari for now!",
                style: TextStyle(fontFamily: 'Bee', fontSize: 15.0),
              )),
            );
          });
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
            icon: Icon(EvaIcons.arrowIosBackOutline),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: SignInForm(),
                      type: PageTransitionType.leftToRight));
            },
          ),
        ),
        /*Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0, left: 20.0),
                  child: Text(
                    'Choose language you want to learn?',
                    style: TextStyle(color: Colors.brown, fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:80.0),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(EvaIcons.arrowIosDownward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.brown,fontFamily: 'Bee',fontSize: 22.0),
                    underline: Container(
                      height: 2,
                      color: Colors.deepOrange,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Hindi', 'Marathi', 'Kacchi', 'Bengali', 'Punjabi', 'Malayalam', 'English',]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          )*/

        body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Choose language you want to learn ?',
                          style: TextStyle(fontFamily: 'Bee', fontSize: 20.0),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: HomePageMundari(),
                                    type: PageTransitionType.rightToLeft));
                          },
                          child: Text(
                            'Mundari',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Bee'),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Hindi',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));},*/,
                          child: Text(
                            'Gujrati',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Kacchi',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Malayalam',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'English',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Marathi',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Punjabi',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Ho',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Tamil',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Kannada',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Santhali',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Banjari',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Kolukt',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Haryanvi',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.brown,
                          onPressed: () =>
                              update() /*{Navigator.pushReplacement(context, PageTransition(child: HomePageTamil(),type: PageTransitionType.rightToLeft));}*/,
                          child: Text(
                            'Bhojpuri',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
