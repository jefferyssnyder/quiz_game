import 'package:flutter/material.dart';

import 'package:quiz_game/start_screen.dart';
import 'package:quiz_game/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-sceens';
    });
  }

  @override
  Widget build(context) {
    Widget renderScreen = StartScreen(switchScreen);

    if (activeScreen == 'questions-sceens') {
      renderScreen = const QuestionsScreen();
    }

    return MaterialApp(
      title: 'FLutter Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Advanced Flutter Basics Quiz'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 101, 31, 224),
                Color.fromARGB(255, 154, 105, 238),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: renderScreen,
        ),
      ),
    );
  }
}
