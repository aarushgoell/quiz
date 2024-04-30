import 'package:flutter/material.dart';
import 'package:quiz_learning/all_questions.dart';
import 'package:quiz_learning/questions_screen.dart';
import 'package:quiz_learning/result_screen.dart';
import 'package:quiz_learning/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activescreen;

  // @override
  // void initState() {
  //  activescreen =  StartScreen(changeScreen);
  //   super.initState();
  // }

  List<String> selectedAnswers = [];

  var activescreen = 'startscreen';

  void changeScreen() {
    setState(() {
      activescreen = 'questionscreen';
    });
  }

  void selectedAnswer(String answers) {
    selectedAnswers.add(answers);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = 'resultscreen';
      });
    }
  }

  void restartfunction() {
    selectedAnswers = [];
    setState(() {
      activescreen = "questionscreen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(changeScreen);

    if (activescreen == 'questionscreen') {
      screenWidget = QuestionsScreen(
        onSelectedAnswers: selectedAnswer,
      );
    } else if (activescreen == 'resultscreen') {
      screenWidget = ResultScreen(
        selectedAnswers: selectedAnswers,
        restartquiz: restartfunction,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 24, 7, 7), Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: screenWidget,
          // child: activescreen == 'startscreen'
          //     ? StartScreen(changeScreen)
          //     : const QuestionsScreen(),
        ),
      ),
    );
  }
}
