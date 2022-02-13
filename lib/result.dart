import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = "Congratz! You may go get a free coffee from Manel";

    if (resultScore >= 1 && resultScore < 3)
      resultText = "Very close. You may get a free nesquik from Manel now";
    else if (resultScore == 0) resultText = "Are you even a student? ô.-";
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: resetHandler,
              child: Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
