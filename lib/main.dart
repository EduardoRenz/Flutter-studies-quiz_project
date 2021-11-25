import 'package:flutter/material.dart';
import './results.dart';
import './questions.dart';

void main() {
  runApp(QuizProject());
}

class _QuizProjectState extends State<QuizProject> {
  num totalScore = 0;
  final List<Map<String, dynamic>> _questions = const [
    {
      'text': 'What\'s your favorite color?',
      'options': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
      ]
    },
    {
      'text': 'What\'s your favorite animal?',
      'options': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Rabbit', 'score': 3},
      ]
    },
    {
      'text': 'What\'s your favorite food?',
      'options': [
        {'text': 'Pizza', 'score': 10},
        {'text': 'Burger', 'score': 5},
        {'text': 'Pasta', 'score': 3},
      ]
    }
  ];
  List<String> answers = [];
  int currentQuestion = 0;
  bool get haveQuestions => currentQuestion < _questions.length;

  void _answer(int index, dynamic value) {
    print(value);
    setState(() {
      answers[index] = value['text'];
      //currentQuestion = (currentQuestion + 1) % answers.length;
      totalScore += value['score'];
      currentQuestion++;
    });

    print(answers);
    print(totalScore);
  }

  Function generateAnswerFunc(int currentQuestion) {
    return (dynamic selected) {
      _answer(currentQuestion, selected);
    };
  }

  void restartQuiz() {
    setState(() {
      currentQuestion = 0;
      totalScore = 0;
      answers = List.filled(_questions.length, '');
    });
  }

  @override
  Widget build(BuildContext context) {
    Function answerFunc = generateAnswerFunc(currentQuestion);
    List<String> questionTexts =
        _questions.map((question) => question['text'].toString()).toList();

    answers = List.filled(_questions.length, '');

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
          : Results(questionTexts, answers, totalScore, restartQuiz),
    ));
  }
}

class QuizProject extends StatefulWidget {
  _QuizProjectState createState() {
    return _QuizProjectState();
  }
}
