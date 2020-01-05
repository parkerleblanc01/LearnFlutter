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

  final questions = const [
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

  void _answerQuestion() {
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
        body: _questionIndex < questions.length ? Column (
          children: [
            Question(questions[_questionIndex]["questionText"]),
            ...(questions[_questionIndex]["answers"] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ) : Center(
          child: Text("You did it!"),
        ),
      ),
    );
  }
}
