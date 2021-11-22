import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final List<String> questions;
  final List<String> answers;

  Results(this.questions, this.answers);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'You did it!',
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
