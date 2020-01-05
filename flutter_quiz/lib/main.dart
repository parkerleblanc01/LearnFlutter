import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    print("Answer " + _questionIndex.toString() + " chosen!");
  }

  @override //Decorator: Makes the code a little bit clearerbh
  Widget build(BuildContext context) {
    var questions = [
      {
        "questionText": "What\'s your favorite color?",
        "answers": ["Black", "Red", "White"]
      },
      {
        "questionText": "What\'s your favorite animal?",
        "answers": ["Dog", "Cat", "Fish"]
      },
      {
        "questionText": "What\'s your favorite state?",
        "answers": ["Arizona", "California", "Georgia"]
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]["questionText"]),
            ...(questions[_questionIndex]["answers"] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
