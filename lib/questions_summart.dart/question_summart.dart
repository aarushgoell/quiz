import 'package:flutter/material.dart';
import 'package:quiz_learning/questions_summart.dart/summary_item.dart';

class SummaryData extends StatelessWidget {
  const SummaryData(this.data, {super.key});

  final List<Map<String, Object>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...data.map((dataa) {
              return SummaryItem(data: dataa);
            }).toList(),
          ],
        ),
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
