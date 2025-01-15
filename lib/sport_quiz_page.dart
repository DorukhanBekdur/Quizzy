import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../result_page.dart';

class sport_quiz_page extends StatefulWidget {
  @override
  _SportQuizPageState createState() => _SportQuizPageState();
}

class _SportQuizPageState extends State<sport_quiz_page> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Who won the FIFA World Cup in 2018?',
      'options': ['Germany', 'Argentina', 'France', 'Brazil'],
      'answer': 'France',
    },
    {
      'question': 'Which country hosted the 2020 Summer Olympics?',
      'options': ['China', 'Japan', 'United States', 'Russia'],
      'answer': 'Japan',
    },
    {
      'question': 'Who is known as "The Greatest of All Time" in tennis?',
      'options': ['Roger Federer', 'Rafael Nadal', 'Serena Williams', 'Novak Djokovic'],
      'answer': 'Roger Federer',
    },
    {
      'question': 'In which sport is the "Vince Lombardi Trophy" awarded?',
      'options': ['Football', 'Basketball', 'Baseball', 'Ice Hockey'],
      'answer': 'Football',
    },
    {
      'question': 'Who holds the record for the most goals in the history of the FIFA World Cup?',
      'options': ['Cristiano Ronaldo', 'Pele', 'Lionel Messi', 'Miroslav Klose'],
      'answer': 'Miroslav Klose',
    },
    {
      'question': 'What year did the first modern Olympic Games take place?',
      'options': ['1900', '1896', '1924', '1980'],
      'answer': '1896',
    },
    {
      'question': 'Which athlete won the most Olympic gold medals in swimming?',
      'options': ['Michael Phelps', 'Ian Thorpe', 'Katie Ledecky', 'Mark Spitz'],
      'answer': 'Michael Phelps',
    },
    {
      'question': 'In which sport would you use a "puck"?',
      'options': ['Football', 'Ice Hockey', 'Baseball', 'Tennis'],
      'answer': 'Ice Hockey',
    },
    {
      'question': 'Who is considered the fastest sprinter of all time?',
      'options': ['Usain Bolt', 'Tyson Gay', 'Carl Lewis', 'Justin Gatlin'],
      'answer': 'Usain Bolt',
    },
    {
      'question': 'Which country did basketball star Michael Jordan play for in the NBA?',
      'options': ['Los Angeles Lakers', 'Miami Heat', 'Chicago Bulls', 'New York Knicks'],
      'answer': 'Chicago Bulls',
    },
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  String? _selectedOption;
  bool _isAnswered = false;

  void _answerQuestion(String selectedOption) {
    setState(() {
      _selectedOption = selectedOption;
      _isAnswered = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      if (_currentQuestionIndex + 1 < _questions.length) {
        setState(() {
          _currentQuestionIndex++;
          _selectedOption = null;
          _isAnswered = false;
        });
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ResultPage(score: _score, total: _questions.length),
          ),
        );
      }
    });

    if (selectedOption == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sport Category',
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF89CFF0),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF89CFF0),
              Color(0xFFBFD8EB),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Divider(thickness: 2, color: Colors.blueAccent),
              SizedBox(height: 20),
              Text(
                currentQuestion['question'] as String,
                style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ...(currentQuestion['options'] as List<String>).map(
                    (option) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isAnswered ? null : () => _answerQuestion(option),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          _isAnswered
                              ? (option == currentQuestion['answer']
                              ? Colors.green
                              : (option == _selectedOption ? Colors.red : Colors.lightBlueAccent))
                              : Colors.lightBlueAccent,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      child: Text(
                        option,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}