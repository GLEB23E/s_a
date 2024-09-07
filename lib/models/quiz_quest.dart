class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShoffledAnswer() {
    final shuf = List.of(answers);
    shuf.shuffle();
    return shuf;
  }
}
