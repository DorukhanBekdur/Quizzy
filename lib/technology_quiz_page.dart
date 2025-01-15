import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../result_page.dart';

class technology_quiz_page extends StatefulWidget {
  @override
  _TechnologyQuizPageState createState() => _TechnologyQuizPageState();
}

class _TechnologyQuizPageState extends State<technology_quiz_page> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Who is known as the father of the computer?',
      'options': ['John von Neumann', 'Alan Turing', 'Charles Babbage', 'Bill Gates'],
      'answer': 'Charles Babbage',
    },
    {
      'question': 'Which programming language is known as the “mother” of all programming languages?',
      'options': ['Java', 'C', 'Python', 'Pascal'],
      'answer': 'C',
    },
    {
      'question': 'What does CPU stand for?',
      'options': [
        'Central Processing Unit',
        'Computer Processing Unit',
        'Central Power Unit',
        'Core Processing Unit'
      ],
      'answer': 'Central Processing Unit',
    },
    {
      'question': 'Who founded Microsoft?',
      'options': ['Bill Gates and Paul Allen', 'Steve Jobs and Wozniak', 'Larry Page and Sergey Brin', 'Mark Zuckerberg'],
      'answer': 'Bill Gates and Paul Allen',
    },
    {
      'question': 'Which company developed the iPhone?',
      'options': ['Nokia', 'Samsung', 'Apple', 'Google'],
      'answer': 'Apple',
    },
    {
      'question': 'What is the name of the first-ever web browser?',
      'options': ['WorldWideWeb', 'Netscape', 'Internet Explorer', 'Mozilla'],
      'answer': 'WorldWideWeb',
    },
    {
      'question': 'Which technology is used to make telephone calls over the Internet?',
      'options': ['LTE', 'VoIP', 'VPN', 'ISP'],
      'answer': 'VoIP',
    },
    {
      'question': 'Who invented the World Wide Web?',
      'options': ['Tim Berners-Lee', 'Vint Cerf', 'Alan Turing', 'Robert Metcalfe'],
      'answer': 'Tim Berners-Lee',
    },
    {
      'question': 'Which company developed the Android operating system?',
      'options': ['IBM', 'Microsoft', 'Apple', 'Google'],
      'answer': 'Google',
    },
    {
      'question': 'What does HTTP stand for?',
      'options': [
        'HyperText Transfer Protocol',
        'High Transfer Text Protocol',
        'HyperTool Text Protocol',
        'HyperLink Transfer Protocol'
      ],
      'answer': 'HyperText Transfer Protocol',
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
          'Technology Category',
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
