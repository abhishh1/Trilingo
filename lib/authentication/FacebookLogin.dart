import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:page_transition/page_transition.dart';
import 'package:trilingo/authentication/loginPage.dart';
import 'package:trilingo/pages/LanguageSelect.dart';



class FacebookPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FacebookPageState();
  }
}

class _FacebookPageState extends State<FacebookPage> {
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFB() async {
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false);
        break;
    }
  }

  /*_logout() {
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        body: Container(
          width: 400.0,
          child: SizedBox(
              child: _isLoggedIn
                  ? InstructionPage()
                  : Scaffold(
                      appBar: AppBar(
                        leading: IconButton(icon: Icon(EvaIcons.arrowIosBack),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: SignInForm(),
                                    type: PageTransitionType.leftToRight));
                          },
                        ),
                        backgroundColor: Colors.deepOrange,
                      ),
                      body: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 200.0),
                              child: Text(
                                'Oh Hello There! Click the button to Sign in via Facebook!',
                                style: TextStyle(fontFamily: 'Bee'),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(
                                  color: Colors.redAccent,
                                  onPressed: () {
                                    _loginWithFB()();
                                  },
                                  child: Text(
                                    "Login with facebook",
                                    style: TextStyle(fontFamily: 'Bee'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
        ),
      ),
    );
  }
}

