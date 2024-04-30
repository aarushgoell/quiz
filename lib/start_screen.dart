import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.questions, {super.key});

  final Function() questions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/image/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(174, 0, 0, 0),
          ),
          // const SizedBox(height: 10,),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Learn flutter the fun way!',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: questions,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
