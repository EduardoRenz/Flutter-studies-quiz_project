import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String value;
  final Function onTap;

  Option(this.value, this.onTap);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        onPressed: () => onTap(value),
        child: Text(value),
      ),
    );
  }
}
