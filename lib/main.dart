import 'package:flutter/material.dart';
import './results.dart';
import './questions.dart';

void main() {
  runApp(QuizProject());
}

class _QuizProjectState extends State<QuizProject> {
  final List<String> answers = ['', '', ''];
  final List<Map<String, dynamic>> _questions = const [
    {
      'text': 'What\'s your favorite color?',
      'options': ['Black', 'Red']
    },
    {
      'text': 'What\'s your favorite animal?',
      'options': ['Dog', 'Cat']
    },
    {
      'text': 'What\'s your favorite food?',
      'options': ['Pizza', 'Burger']
    }
  ];
  int currentQuestion = 0;
  bool get haveQuestions => currentQuestion < _questions.length;

  void _answer(int index, dynamic value) {
    setState(() {
      answers[index] = value;
      //currentQuestion = (currentQuestion + 1) % answers.length;
      currentQuestion++;
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
    Function answerFunc = generateAnswerFunc(currentQuestion);
    List<String> questionTexts =
        _questions.map((question) => question['text'].toString()).toList();

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: haveQuestions
          ? Questions(
              questions: _questions,
              currentQuestion: currentQuestion,
              answer: answerFunc)
          : Results(questionTexts, answers),
    ));
  }
}

class QuizProject extends StatefulWidget {
  _QuizProjectState createState() {
    return _QuizProjectState();
  }
}
