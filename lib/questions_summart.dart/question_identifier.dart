import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {required this.questionindex, required this.isCorrectAnswer, super.key});

  final int questionindex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 216, 29, 91)
            : const Color.fromARGB(255, 110, 39, 176),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        questionindex.toString(),
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
