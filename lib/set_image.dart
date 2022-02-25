import 'package:flutter/material.dart';

class SetImage extends StatelessWidget {
  final bool _answerChosen;
  final int _isRightAnswer;

  SetImage(this._answerChosen, this._isRightAnswer);
  @override
  Widget build(BuildContext context) {
    return (_answerChosen == true
        ? (_isRightAnswer == 1
            ? Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/red_check_mark.png",
                    width: 150, height: 150, fit: BoxFit.fill),
              )
            : Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/red_cross_mark.png",
                    width: 150, height: 150, fit: BoxFit.fill),
              ))
        : SizedBox(
            height: 100,
          ));
  }
}
