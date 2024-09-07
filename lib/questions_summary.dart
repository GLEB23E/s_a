import 'package:flutter/material.dart';

class QuestionsSummary extends StatefulWidget {
  const QuestionsSummary(this.summartData, {super.key});
  final List<Map<String, Object>> summartData;
  @override
  State<QuestionsSummary> createState() {
    return _QuestionsSummaryState();
  }
}

class _QuestionsSummaryState extends State<QuestionsSummary> {
  Color color = Colors.red; // Переменная цвета

  void totalColor(Map<String, Object> data) {
    setState(() {
      // Изменяем состояние, если ответ пользователя правильный
      if (data['user_a'] == data['correct_antw']) {
        color = Colors.green[300]!;
      } else {
        color = Colors.red; // Иначе оставляем цвет красным
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: widget.summartData.map((data) {
            // Используем widget.summartData для доступа к данным
            totalColor(data);

            return Row(
              children: [
                // Зеленый или красный кружок с числом
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color, // Используем динамический цвет
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    ((data['q_i'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String),
                      const SizedBox(height: 10),
                      Text(data['user_a'] as String),
                      const SizedBox(height: 10),
                      Text(data['correct_antw'] as String),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
