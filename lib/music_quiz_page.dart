import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../result_page.dart';

class music_quiz_page extends StatefulWidget {
  @override
  _MusicQuizPageState createState() => _MusicQuizPageState();
}

class _MusicQuizPageState extends State<music_quiz_page> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Who is known as the "King of Pop"?',
      'options': ['Elvis Presley', 'Michael Jackson', 'Prince', 'Freddie Mercury'],
      'answer': 'Michael Jackson',
    },
    {
      'question': 'Which band wrote the famous song "Bohemian Rhapsody"?',
      'options': ['The Rolling Stones', 'Queen', 'The Beatles', 'Led Zeppelin'],
      'answer': 'Queen',
    },
    {
      'question': 'Who is the best-selling female artist of all time?',
      'options': ['Madonna', 'Mariah Carey', 'Whitney Houston', 'Celine Dion'],
      'answer': 'Mariah Carey',
    },
    {
      'question': 'Which city is known as the birthplace of jazz music?',
      'options': ['New York', 'Nashville', 'Los Angeles', 'New Orleans'],
      'answer': 'New Orleans',
    },
    {
      'question': 'Who was the lead singer of the Beatles?',
      'options': ['Paul McCartney', 'John Lennon', 'George Harrison', 'Ringo Starr'],
      'answer': 'John Lennon',
    },
    {
      'question': 'Which music festival is known as "the greatest show on Earth"?',
      'options': ['Coachella', 'Glastonbury', 'Woodstock', 'Tomorrowland'],
      'answer': 'Woodstock',
    },
    {
      'question': 'Which song is often credited with starting the "British Invasion" of the United States in the 1960s?',
      'options': ['I Want to Hold Your Hand', 'Hey Jude', 'Let It Be', 'Help!'],
      'answer': 'I Want to Hold Your Hand',
    },
    {
      'question': 'Which musician is famous for the albums "Purple Rain" and "1999"?',
      'options': ['David Bowie', 'Prince', 'Jimi Hendrix', 'Elton John'],
      'answer': 'Prince',
    },
    {
      'question': 'What year did the famous music video "Thriller" by Michael Jackson debut?',
      'options': ['1983', '1990', '1979', '1985'],
      'answer': '1983',
    },
    {
      'question': 'Which classical composer is known for "Symphony No. 9" or "Ode to Joy"?',
      'options': ['Mozart', 'Beethoven', 'Chopin', 'Bach'],
      'answer': 'Beethoven',
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
          'Music Category',
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