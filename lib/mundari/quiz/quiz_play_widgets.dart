import 'package:flutter/material.dart';

class OptionTileMundari extends StatefulWidget {
  final String option, description, correctAnswer, optionSelected;

  OptionTileMundari(
      {this.description, this.correctAnswer, this.option, this.optionSelected});

  @override
  _OptionTileMundariState createState() => _OptionTileMundariState();
}

class _OptionTileMundariState extends State<OptionTileMundari> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 28,
            width: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.optionSelected == widget.description
                        ? widget.description == widget.correctAnswer
                            ? Colors.green.withOpacity(0.7)
                            : Colors.red.withOpacity(0.7)
                        : Colors.grey,
                    width: 1.5),
                color: widget.optionSelected == widget.description
                    ? widget.description == widget.correctAnswer
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7)
                    : Colors.white,
                borderRadius: BorderRadius.circular(24)),
            child: Text(
              widget.option,
              style: TextStyle(
                fontFamily: 'Bee',
                color: widget.optionSelected == widget.description
                    ? Colors.white
                    : Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.description,
            style: TextStyle(
                fontSize: 17, color: Colors.black54, fontFamily: 'Bee'),
          )
        ],
      ),
    );
  }
}

class NoOfQuestionTileMundari extends StatefulWidget {
  final String text;
  final int number;

  NoOfQuestionTileMundari({this.text, this.number});

  @override
  _NoOfQuestionTileMundariState createState() => _NoOfQuestionTileMundariState();
}

class _NoOfQuestionTileMundariState extends State<NoOfQuestionTileMundari> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              child: Row(
                children: [
                  Container(
                    width: 40.0,
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14)),
                        color: Colors.black),
                    child: Center(
                      child: Text(
                        "${widget.number}",
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'Bee'),
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                        color: Colors.brown),
                    child: Center(
                      child: Text(
                        widget.text,
                        style:
                            TextStyle(color: Colors.white, fontFamily: 'Bee'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
