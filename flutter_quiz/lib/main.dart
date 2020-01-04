import 'package:flutter/material.dart';

// Entry Function
void main() {
  runApp(FlutterQuiz());
}

class FlutterQuiz extends StatelessWidget {
  @override //Decorator: Makes the code a little bit clearerbh
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Text("This is my default text!"),
      ),
    );
  }
}
