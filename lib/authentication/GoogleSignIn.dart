import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trilingo/pages/LanguageSelect.dart';

class MyGoogleApp extends StatefulWidget {
  @override
  _MyGoogleAppState createState() => _MyGoogleAppState();
}

class _MyGoogleAppState extends State<MyGoogleApp> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;


  GoogleSignIn _googleSignIn = new GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isSignIn
            ? InstructionPage()
            : Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.deepOrange,
                ),
                body: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 200.0),
                        child: Text(
                            'Oh Hello There! Click the button to Sign in via Google!',style: TextStyle(fontFamily: 'Bee'),),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            color: Colors.redAccent,
                            onPressed: () {
                              handleSignIn();
                            },
                            child: Text(
                              "Login with Google",
                              style: TextStyle(fontFamily: 'Bee'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }

  /*onGoogleSignIn() async{
   Navigator.push(
      context,
      MaterialPageRoute(
         builder: (context) =>
         HomePageMundari(user, googleSignIn)));
  }*/

  bool isSignIn = false;

  Future<void> handleSignIn() async {
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = (await _auth.signInWithCredential(credential));
   Navigator.push(context, new MaterialPageRoute(
              builder: (BuildContext context) => new InstructionPage()));


    user = result.user;

    setState(() {
      isSignIn = true;
    });
  }

  Future<void> gooleSignout() async {
    await _auth.signOut().then((onValue) {
      _googleSignIn.signOut();
      setState(() {
        isSignIn = true;
      });
    });
  }
}
