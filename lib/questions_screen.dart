import 'package:flutter/material.dart';
import 'package:quiz_learning/all_questions.dart';
import 'package:quiz_learning/answerbutton_styling.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswers});

  final void Function(String answer) onSelectedAnswers;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionindex = 0;

  void answerQuestion(String selectanswer) {
    widget.onSelectedAnswers(selectanswer);
    setState(() {
      questionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionindex];
    return SizedBox(
      // We can also use here center widget inplace of Sizedbox
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            ...currentQuestion.shuffledAnswers().map((answers) {
              return AnswerButton(
                  answer: answers,
                  onTap: () {
                    answerQuestion(answers);
                  });
            })
          ],
        ),
      ),
    );
  }
}
