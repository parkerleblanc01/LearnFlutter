import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// Entry Function
void main() {
  runApp(FlutterQuiz());
}

class FlutterQuiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlutterQuizState();
  }
}

class _FlutterQuizState extends State<FlutterQuiz> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      "questionText": "What\'s your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 6},
        {"text": "White", "score": 3},
        {"text": "Blue", "score": 1},
        {"text": "Silver", "score": 1},
        {"text": "Green", "score": 1},
        {"text": "Pink", "score": 6}
      ]
    },
    {
      "questionText": "What\'s your favorite animal?",
      "answers": [
        {"text": "Dog", "score": 1},
        {"text": "Cat", "score": 10},
        {"text": "Fish", "score": 9},
        {"text": "Bunny", "score": 5},
        {"text": "Hampster", "score": 8},
      ]
    },
    {
      "questionText": "Do you like pizza?",
      "answers": [
        {"text": "Yes", "score": 1},
        {"text": "No", "score": 10},
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  @override //Decorator: Makes the code a little bit clearerbh
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_resetQuiz, _totalScore),
      ),
    );
  }
}
