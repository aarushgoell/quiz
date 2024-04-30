import 'package:flutter/material.dart';
import 'package:quiz_learning/questions_summart.dart/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.data, super.key});

  final Map<String, Object> data;

  @override
  Widget build(BuildContext context) {
    final correctanswer = data['correctanswer'] == data['useranswer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
              questionindex: data['question_index'] as int,
              isCorrectAnswer: correctanswer),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['question'] as String,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Correct Answer :  ${data['correctanswer']}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 216, 29, 91),
                  ),
                ),
                Text(
                  'Your Answer : ${data['useranswer']}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 110, 39, 176),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// summary.add({
        //   'question_index': i + 1,
        //   'question' : questions[i].text,
        //   'correctanswer' : questions[i].answers[0],
        //   'useranswer' : selectedAnswers[i],
        // });
