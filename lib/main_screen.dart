import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              'assets/images/images.jpeg',
              width: 300,
              height: 200,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            'Learn Flutter with Me;)',
            style: TextStyle(
              color: Color.fromARGB(255, 213, 206, 230),
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 100),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_circle_right_outlined),
            label: const Text(
              'START',
            ),
          )
        ],
      ),
    );
  }
}
