import 'package:flutter/material.dart';
import 'package:s_a/main_screen.dart';
import 'package:logger/logger.dart';
import 'package:s_a/questions.dart';

import 'package:s_a/results.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuisState();
  }
}

class _QuisState extends State<Quiz> {
  final logger = Logger();
  var activeScreen = 'start-screen';
  List<String> selectedanswers = [];
  @override
  void initState() {
    activeScreen = 'start-screen';
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = '';
    });
  }

  void ssScreen() {
    setState(() {
      activeScreen = 'results-screen';
    });
  }

  void ssScreen2(String answer) {
    selectedanswers.add(answer);
    logger.i(selectedanswers);
  }

  @override
  Widget build(context) {
    Widget? page;
    if (activeScreen == 'start-screen') {
      page = MainScreen(switchScreen);
    }
    if (activeScreen == '') {
      page = QuestionScreen(onSel: ssScreen2, sel: ssScreen);
    }
    if (activeScreen == 'results-screen') {
      page = ResultsScreen(
        chosenantw: selectedanswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 150, 41, 7),
                Color.fromARGB(255, 232, 124, 91),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: page,
        ),
      ),
    );
  }
}
