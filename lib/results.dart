import 'package:flutter/material.dart';
import 'package:s_a/data/questions2.dart';
import 'package:s_a/questions_summary.dart';
import 'package:logger/logger.dart';
import 'package:s_a/quiz.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key, required this.chosenantw});
  final List<String> chosenantw;

  List<Map<String, Object>> getSum() {
    final List<Map<String, Object>> summary = [];
    final logger = Logger();
    logger.i(chosenantw.length);
    for (var i = 0; i < chosenantw.length; i++) {
      if (i >= 7) {
        summary.add(
          {
            'q_i': i,
            'question': questions[i].text,
            'correct_antw': questions[i].answers[0],
            'user_a': chosenantw[i],
          },
        );
        break;
      }
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
  State<ResultsScreen> createState() {
    return _ResultsScreen();
  }
}

class _ResultsScreen extends State<ResultsScreen> {
  void clButoon() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Quiz()),
      );
    });
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
                QuestionsSummary(widget.getSum()),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: clButoon, child: const Text('restart all'))
              ],
            )));
  }
}
