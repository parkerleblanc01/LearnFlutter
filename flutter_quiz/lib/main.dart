import 'package:flutter/material.dart';

// Entry Function
void main() {
  runApp(FlutterQuiz());
}

class FlutterQuiz extends StatelessWidget {
  void answerQuestion() {
    print("Answer 2 chosen!");
  }

  @override //Decorator: Makes the code a little bit clearerbh
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Text('The question!'),
            RaisedButton(
              child: Text('Answer 1'),
              onPressed: () {
                print("Answer 1 chosen!");
              },
            ),
            RaisedButton(
              child: Text('Answer 2'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer 3'),
              onPressed: () {
                print("Answer 3 chosen!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
