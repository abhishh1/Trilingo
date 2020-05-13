import 'package:flutter/material.dart';
import 'package:trilingo/mundari/MainListMundari.dart';


class LearnPageMundari extends StatelessWidget {
  int passBack,passTotal;
  LearnPageMundari({this.passBack,this.passTotal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
             SizedBox(
              width: 400.0,
              height: 670.0,
              child: CategoryPageMundari(passBack: passBack,passTotal: passTotal,),
            )
          ],
        ),
      ),
    );
  }
}
