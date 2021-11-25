import 'package:flutter/material.dart';
import './question.dart';
import './option.dart';

class Questions extends StatelessWidget {
  final int currentQuestion;
  final List<Map<String, dynamic>> questions;
  final Function answer;

  Questions(
      {required this.questions,
      required this.currentQuestion,
      required this.answer});

  bool get haveQuestions => currentQuestion < questions.length;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> options =
        haveQuestions ? questions[currentQuestion]['options'] : [];

    List<Widget> currentOptions = options.map((option) {
      return Option(
        option,
        answer,
      );
    }).toList();

    return Column(children: <Widget>[
      Question(questions[currentQuestion]['text'].toString()),
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: currentOptions)
    ]);
  }
}
