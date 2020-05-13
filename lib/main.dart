import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trilingo/authentication/loginPage.dart';
import 'package:trilingo/mundari/HomePageMandari.dart';
import 'package:trilingo/mundari/MainListMundari.dart';
import 'package:trilingo/pages/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: new ThemeData(
              cursorColor: Colors.amberAccent,
              primarySwatch: Colors.brown,
              brightness: Brightness.light,
              fontFamily: 'Bee',
              accentColor: Colors.orange),
          home: SignInForm()),
    );
  }
}
