import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;
  

  Result(this.resetQuiz, this.resultScore);

  String get resultPhrase {
    var resultText = "\n\nLamo Score: " + resultScore.toString();

    if(resultScore == 3){
      resultText = "You are the coolest";
    }
    else if(resultScore < 12){
      resultText = "Pretty cool" + resultText;
    }
    else if(resultScore < 18){
      resultText = "Kinda cool" + resultText;
    }
    else {
      resultText = "Not cool bro" + resultText;
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: 
              Text("Restart Quiz!"),
              onPressed: resetQuiz,
              textColor: Colors.blue,
            ),
        ],
      ),
    );
  }
}
