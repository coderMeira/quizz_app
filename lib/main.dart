import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';

import 'quiz.dart';
import 'result.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "How to check the length of a string",
      "answers": [
        {"text": "strcheck", "score": 0},
        {"text": "strsize", "score": 0},
        {"text": "strlength", "score": 0},
        {"text": "strlen", "score": 1},
      ],
    },
    {
      "questionText": "When does the cleaning lady empty the fridge",
      "answers": [
        {"text": "Tuesday", "score": 0},
        {"text": "Never", "score": 0},
        {"text": "Saturday", "score": 1},
        {"text": "Everyday", "score": 0},
      ],
    },
    {
      "questionText": "What's our lovely security's name?",
      "answers": [
        {"text": "Joao Borbulho", "score": 0},
        {"text": "Manel", "score": 0},
        {"text": "Manuel", "score": 1},
        {"text": "Security? Bitch we're the danger", "score": 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0x00000000),
            appBar: AppBar(
              title: Text('42 Quizz'),
              centerTitle: true,
              backgroundColor: Colors.red,
            ),
            body: _questionIndex < _questions.length
                ? Quiz(_questions, _answerQuestion, _questionIndex)
                : Result(_totalScore, _resetQuiz)));
  }
}

void main() {
  runApp(MyApp());
}
