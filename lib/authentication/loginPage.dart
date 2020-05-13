import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trilingo/authentication/Auth.dart';
import 'package:trilingo/authentication/FacebookLogin.dart';
import 'package:trilingo/authentication/signUpPage.dart';
import 'package:trilingo/pages/LanguageSelect.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? InstructionPage()
        : Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              backgroundColor: Colors.deepOrangeAccent,
              toolbarOpacity: 0.1,
              /*title: RichText(
                text: TextSpan(
                  text: 'Welcome ',
                  style: TextStyle(
                      fontFamily: 'Bee', color: Colors.brown, fontSize: 20.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'back',
                        style: TextStyle(color: Colors.brown, fontSize: 20.0)),
                  ],
                ),
              ),*/
            ),
            body: SingleChildScrollView(
              child: AspectRatio(
                aspectRatio: 0.6,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Trilingo ',
                            style: TextStyle(
                                fontFamily: 'Rockdiz',
                                color: Colors.brown,
                                fontSize: 40.0),
                            children: <TextSpan>[],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 00.0),
                      child: Container(
                        width: 400.0,
                        height: 440.0,
                        decoration: BoxDecoration(color: Colors.white),
                        padding: const EdgeInsets.only(
                            top: 00.0, left: 50.0, right: 50.0),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 180.0),
                                child: Text(
                                  'Email address*',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Bee',
                                      fontSize: 12.0),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.brown, fontFamily: 'Bee'),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter a email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, right: 200.0),
                                child: Text(
                                  'Password*',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Bee',
                                      fontSize: 12.0),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (val) => val.length < 8
                                      ? 'Enter correct password'
                                      : null,
                                  style: TextStyle(
                                      color: Colors.brown, fontFamily: 'Bee'),
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 00.0),
                                child: RaisedButton(
                                  shape: Border.all(
                                      color: Colors.deepOrangeAccent),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontFamily: 'Bee', color: Colors.brown),
                                  ),
                                  color: Colors.white,
                                  onPressed: () async {
                                    if (_formkey.currentState.validate()) {
                                      setState(() => loading = true);
                                      dynamic result = await _authService
                                          .signInWithEmailAndPassword(
                                              email, password);
                                      if (result == null)
                                        setState(() => error =
                                            'Could not sign in with those credentials');
                                      loading = false;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.brown, fontFamily: 'Bee'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, left: 10.0),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 00.0),
                                      child: SizedBox(
                                          width: 120.0,
                                          child: Divider(
                                            color: Colors.black,
                                          )),
                                    ),
                                    Text(
                                      ' or ',
                                      style: TextStyle(fontFamily: 'Bee'),
                                    ),
                                    SizedBox(
                                        width: 120.0,
                                        child: Divider(
                                          color: Colors.black,
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 90.0, top: 20.0),
                                      child: Row(
                                        children: <Widget>[
                                          MaterialButton(
                                            splashColor: Colors.white,
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  PageTransition(
                                                      child: FacebookPage(),
                                                      type: PageTransitionType
                                                          .downToUp));
                                            },
                                            color: Colors.blueAccent,
                                            child: Text(
                                              'Facebook',
                                              style:
                                                  TextStyle(fontFamily: 'Bee'),
                                            ),
                                          ),
                                          /*Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30.0),
                                            child: MaterialButton(
                                              splashColor: Colors.white,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        child: MyGoogleApp(),
                                                        type: PageTransitionType
                                                            .downToUp));
                                              },
                                              color: Colors.redAccent,
                                              child: Text(
                                                'Google',
                                                style: TextStyle(
                                                    fontFamily: 'Bee'),
                                              ),
                                            ),
                                          )*/
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              /*MaterialButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forget Password?',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )*/
                            ],
                          ),
                        ),
                      ),
                    ),
                    /*ActionChip(backgroundColor: Colors.redAccent,label: Text('Slow internet connection?'),onPressed: (){
                        showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
                  
                      
                  height: 50.0,
                  child: Center(
                    child: SizedBox(
                      height: 80.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Row(
                          children: <Widget>[
                            Text('Feature shall be updated soon! ',style: TextStyle(fontFamily: 'Bee',color: Colors.lightBlueAccent),),
                            Icon(EvaIcons.messageCircleOutline,color: Colors.red,)
                          ],
                        ),
                      ),
                    ),
                  ));
        });
                      },labelStyle: TextStyle(fontFamily: 'Bee'),),*/
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 50.0),
                      child: SafeArea(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    color: Colors.brown, fontFamily: 'Bee'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: MaterialButton(
                                splashColor: Colors.black,
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: RegisterForm(),
                                          type: PageTransitionType.downToUp));
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Sign up',
                                      style: TextStyle(
                                          color: Colors.deepOrangeAccent,
                                          fontFamily: 'Bee'),
                                    ),
                                    Icon(
                                      EvaIcons.navigation2Outline,
                                      color: Colors.brown,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
