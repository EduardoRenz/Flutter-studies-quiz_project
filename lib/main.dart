import 'package:flutter/material.dart';
import './question.dart';
import './option.dart';

void main() {
  runApp(QuizProject());
}

class _QuizProjectState extends State<QuizProject> {
  final List<dynamic> answers = [null, null, null];

  int currentQuestion = 0;
  void _answer(int index, dynamic value) {
    setState(() {
      answers[index] = value;
      currentQuestion = (currentQuestion + 1) % answers.length;
    });
    print(answers);
  }

  Function generateAnswerFunc(int currentQuestion) {
    return (dynamic value) {
      _answer(currentQuestion, value);
    };
  }

  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
      'What\'s your favorite food?',
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Column(
        children: <Widget>[
          Question(questions[currentQuestion]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Option(
                'Red',
                generateAnswerFunc(currentQuestion),
              ),
              Option(
                'Green',
                generateAnswerFunc(currentQuestion),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

class QuizProject extends StatefulWidget {
  _QuizProjectState createState() {
    return _QuizProjectState();
  }
}
