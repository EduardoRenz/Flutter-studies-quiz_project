import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final List<String> questions;
  final List<String> answers;
  final num totalScore;
  final Function resetQuiz;

  Results(this.questions, this.answers, this.totalScore, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'You did it!',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Text(
            'You got $totalScore !',
          ),
          ElevatedButton(
            child: Text('Restart Quiz'),
            onPressed: () => resetQuiz(),
          )
        ],
      ),
    );
  }
}
