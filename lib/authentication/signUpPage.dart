import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trilingo/authentication/Auth.dart';
import 'package:trilingo/authentication/loginPage.dart';
import 'package:trilingo/pages/LanguageSelect.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String mobileNumber = '';
  String confirmPassword = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? InstructionPage()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              centerTitle: true,
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
              title: RichText(
                text: TextSpan(
                  text: 'Create ',
                  style: TextStyle(
                      fontFamily: 'Bee', color: Colors.white, fontSize: 20.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'an ',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    TextSpan(
                        text: 'account',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  ],
                ),
              ),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Column(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(
                        top: 90.0, left: 60.0, right: 60.0),
                    decoration: BoxDecoration(color: Colors.white60),
                    child: Form(
                        key: _formkey,
                        child: Column(children: <Widget>[
                          TextFormField(
                            style: TextStyle(
                                color: Colors.brown, fontFamily: 'Bee'),
                            decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    fontFamily: 'Bee', fontSize: 14.0)),
                            onChanged: (val) {
                              setState(() => name = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.brown,fontFamily: 'Bee'),
                            decoration: InputDecoration(
                                hintText: 'Email address',
                                hintStyle: TextStyle(
                                    fontFamily: 'Bee', fontSize: 14.0)),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            style: TextStyle(
                                color: Colors.brown, fontFamily: 'Bee'),
                            decoration: InputDecoration(
                                hintText: 'Mobile number',
                                hintStyle: TextStyle(
                                    fontFamily: 'Bee', fontSize: 14.0)),
                            onChanged: (val) {
                              setState(() => mobileNumber = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (val) => val.length < 8
                                ? 'Enter 8+ chars long password'
                                : null,
                            style: TextStyle(
                                color: Colors.brown, fontFamily: 'Bee'),
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontFamily: 'Bee', fontSize: 14.0)),
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            style: TextStyle(
                                color: Colors.brown, fontFamily: 'Bee'),
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                    fontFamily: 'Bee', fontSize: 14.0)),
                            onChanged: (val) {
                              setState(() => confirmPassword = val);
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 17.0),
                            child: RaisedButton(
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontFamily: 'bee',
                                      color: Colors.deepOrangeAccent),
                                ),
                                color: Colors.white,
                                onPressed: () async {
                                  if (_formkey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _authService
                                        .registerWithEmailAndPassword(
                                            email, password);
                                    if (result == null) {
                                      setState(() =>
                                          error = 'please use a valid email');
                                      loading = false;
                                    }
                                  }
                                }),
                          ),
                          SizedBox(height: 10),
                          Text(
                            error,
                            style: TextStyle(
                                fontFamily: 'Bee', color: Colors.brown),
                          ),
                          /*SizedBox(
                              child: Column(children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 00.0),
                                child: Row(
                                  children: <Widget>[
                                    MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: FacebookPage(),
                                                type: PageTransitionType
                                                    .leftToRight));
                                      },
                                      color: Colors.blueAccent,
                                      child: Text('Facebook'),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  child: MyGoogleApp(),
                                                  type: PageTransitionType
                                                      .leftToRight));
                                        },
                                        color: Colors.redAccent,
                                        child: Text('Google'),
                                      ),
                                    )
                                  ],
                                ))
                          ]))*/
                        ]))),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, left: 50.0),
                    child: SafeArea(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 00.0),
                            child: Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.brown,fontFamily: 'Bee'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: MaterialButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: SignInForm(),
                                        type: PageTransitionType.upToDown));
                              },
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Log in',
                                    style: TextStyle(
                                        fontFamily: 'Bee',
                                        color: Colors.deepOrange),
                                  ),
                                  Icon(EvaIcons.navigation2Outline,
                                      color: Colors.brown)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ));
  }
}
