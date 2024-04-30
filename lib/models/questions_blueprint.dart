class Questions {
  const Questions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> shuffledAnswers() {
    final shuffledanswer = List.of(answers);
    shuffledanswer.shuffle();
    return shuffledanswer;
  }
}
