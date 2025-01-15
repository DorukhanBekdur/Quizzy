import 'package:flutter/material.dart';
import 'package:quizzy/start_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(QuizzyApp());
}

class QuizzyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzy',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: StartScreen(),
    );
  }
}







