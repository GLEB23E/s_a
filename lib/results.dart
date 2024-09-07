import 'package:flutter/material.dart';
import 'package:s_a/data/questions2.dart';
import 'package:s_a/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenantw});
  final List<String> chosenantw;

  List<Map<String, Object>> getSum() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenantw.length; i++) {
      summary.add(
        {
          'q_i': i,
          'question': questions[i].text,
          'correct_antw': questions[i].answers[0],
          'user_a': chosenantw[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Your dawg...'),
                const SizedBox(
                  height: 30,
                ),
                QuestionsSummary(getSum()),
                const SizedBox(
                  height: 30,
                ),
                TextButton(onPressed: () {}, child: const Text('restart all'))
              ],
            )));
  }
}
