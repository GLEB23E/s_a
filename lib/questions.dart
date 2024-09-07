import 'package:logger/logger.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:s_a/button.dart';
import 'package:s_a/data/questions2.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSel, required this.sel});
  final void Function(String answer) onSel;
  final void Function() sel;

  @override
  State<QuestionScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionScreen> {
  var index = 0;
  final logger = Logger();

  void answerQuestion(String selectedanswer) {
    widget.onSel(selectedanswer);
    setState(() {
      if (index < questions.length - 1) {
        widget.onSel(selectedanswer);
        index++;
      }
      if (index == questions.length - 1) {
        widget.sel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currQuest = questions[index];
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 93, 20, 15),
            Color.fromARGB(255, 15, 73, 121),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                textAlign: TextAlign.center,
                currQuest.text,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(177, 255, 255, 255),
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 50),
              ...currQuest.getShoffledAnswer().map((answer) {
                return ButtonAntw(
                    answer: answer,
                    onTap: () {
                      answerQuestion(answer);
                    });
              }), // Убедитесь, что используется toList()
            ],
          ),
        ),
      ),
    );
  }
}
