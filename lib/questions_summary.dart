import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summartData, {super.key});
  final List<Map<String, Object>> summartData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summartData.map((data) {
        return Row(
          children: [
            Text(((data['q_i'] as int) + 1).toString()),
            Column(
              children: [
                Text(data['question'] as String),
                const SizedBox(
                  height: 30,
                ),
                Text(data['user_a'] as String),
                const SizedBox(
                  height: 30,
                ),
                Text(data['correct_antw'] as String),
              ],
            ),
          ],
        );
      }).toList(),
    );
  }
}
