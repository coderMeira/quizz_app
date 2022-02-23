import 'dart:ui';

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
      "questionText": "When does the cleaning lady empty C2's fridge",
      "answers": [
        {"text": "Tuesday", "score": 0},
        {"text": "Never", "score": 0},
        {"text": "Friday", "score": 1},
        {"text": "Everyday", "score": 0},
      ],
    },
    {
      "questionText": "What's our lovely security's name?",
      "answers": [
        {"text": "Joao Borbulho", "score": 0},
        {"text": "Manel", "score": 1},
        {"text": "Manuel", "score": 0},
        {"text": "Security? Bitch we're the danger", "score": 0},
      ],
    },
    {
      "questionText": "Where was 42 founded?",
      "answers": [
        {"text": "Portugal", "score": 0},
        {"text": "Sillicon Valley", "score": 0},
        {"text": "Amsterdam", "score": 0},
        {"text": "Paris", "score": 1},
      ],
    },
    {
      "questionText": "How many fridges are there in 42 Lisboa?",
      "answers": [
        {"text": "2", "score": 0},
        {"text": "6", "score": 0},
        {"text": "5", "score": 0},
        {"text": "8", "score": 1},
      ],
    },
    {
      "questionText": "Which of these statements is not true?",
      "answers": [
        {
          "text":
              "ASCII stands for American Standard Code for Information Indexation",
          "score": 1
        },
        {"text": "Malloc stands for memory allocation", "score": 0},
        {"text": "C is older than C++", "score": 0},
        {"text": "An array starts at index 0", "score": 0},
      ],
    },
    {
      "questionText":
          "What's the correct value to return to the OS upon the successful completion of a program?",
      "answers": [
        {"text": "-1", "score": 0},
        {"text": "1", "score": 0},
        {"text": "0", "score": 1},
        {"text": "Programs do not return a value", "score": 0},
      ],
    },
    {
      "questionText": "Which symbol is used to make comments in C?",
      "answers": [
        {"text": "//", "score": 1},
        {"text": "#", "score": 0},
        {"text": "!!", "score": 0},
        {"text": "<!--", "score": 0},
      ],
    },
    {
      "questionText": "In which standard lib is the function print() located?",
      "answers": [
        {"text": "stdlib.h", "score": 0},
        {"text": "stdio.h", "score": 1},
        {"text": "stdout.h", "score": 0},
        {"text": "unistd.h", "score": 0},
      ],
    },
    {
      "questionText": "When was the first piscine in Lisbon?",
      "answers": [
        {"text": "October 2021", "score": 0},
        {"text": "November 2020", "score": 0},
        {"text": "October 2020", "score": 1},
        {"text": "January 2021", "score": 0},
      ],
    },
    {
      "questionText": "When was 42 founded?",
      "answers": [
        {"text": "2016", "score": 0},
        {"text": "2013", "score": 1},
        {"text": "2020", "score": 0},
        {"text": "2012", "score": 0},
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
              elevation: 0,
              title: Text('42 Quiz',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42)),
              centerTitle: true,
              backgroundColor: Colors.red,
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    backgroundColor: Colors.white,
                    value: (_questionIndex * 0.1),
                    minHeight: 15,
                  )),
                  (_questionIndex < _questions.length
                      ? Quiz(_questions, _answerQuestion, _questionIndex)
                      : Result(_totalScore, _resetQuiz)),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/red_check_mark.png",
                        width: 150, height: 150, fit: BoxFit.fill),
                  )
                ])));
  }
}

void main() {
  runApp(MyApp());
}
