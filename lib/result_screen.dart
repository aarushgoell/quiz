import 'package:flutter/material.dart';
import 'package:quiz_learning/all_questions.dart';
import 'package:quiz_learning/questions_summart.dart/question_summart.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.restartquiz, required this.selectedAnswers});

  final List<String> selectedAnswers;

  final void Function() restartquiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question': questions[i].text,
        'correctanswer': questions[i].answers[0],
        'useranswer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summardata = getSummaryData();
    final totalquestions = questions.length;
    final correctquestions = summardata.where((data) {
      return data['correctanswer'] == data['useranswer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctquestions out of $totalquestions questions correctly',
              style: const TextStyle(fontSize: 15, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            SummaryData(summardata),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
                onPressed: restartquiz,
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }
}
