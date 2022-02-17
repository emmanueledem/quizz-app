import 'package:flutter/material.dart';

class ScoreBox {
  List<Icon> scoreKeeper = [];
  void _checkAnswer(correctAnswer) {
    if (correctAnswer == true) {
      scoreKeeper.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else if (correctAnswer == false) {
      scoreKeeper.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
  }

  getchoice(bool correctAnswer) {
    return _checkAnswer(correctAnswer);
  }
}
