import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../result_page.dart';

class history_quiz_page extends StatefulWidget {
  @override
  _HistoryQuizPageState createState() => _HistoryQuizPageState();
}

class _HistoryQuizPageState extends State<history_quiz_page> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Who was the first President of the United States?',
      'options': ['George Washington', 'Thomas Jefferson', 'Abraham Lincoln', 'John Adams'],
      'answer': 'George Washington',
    },
    {
      'question': 'In which year did World War II end?',
      'options': ['1939', '1914', '1945', '1963'],
      'answer': '1945',
    },
    {
      'question': 'Who was the famous Queen of ancient Egypt?',
      'options': ['Queen Victoria', 'Cleopatra', 'Nefertiti', 'Marie Antoinette'],
      'answer': 'Cleopatra',
    },
    {
      'question': 'In which battle was Napoleon Bonaparte defeated in 1815?',
      'options': ['Battle of Waterloo', 'Battle of Trafalgar', 'Battle of Hastings', 'Battle of the Bulge'],
      'answer': 'Battle of Waterloo',
    },
    {
      'question': 'Who was the first woman to fly solo across the Atlantic Ocean?',
      'options': ['Susan B. Anthony', 'Harriet Tubman', 'Amelia Earhart', 'Rosa Parks'],
      'answer': 'Amelia Earhart',
    },
    {
      'question': 'Which empire was ruled by Julius Caesar?',
      'options': ['Roman Empire', 'Ottoman Empire', 'Mongol Empire', 'Byzantine Empire'],
      'answer': 'Roman Empire',
    },
    {
      'question': 'In which year did the Titanic sink?',
      'options': ['1927', '1898', '1923', '1912'],
      'answer': '1912',
    },
    {
      'question': 'Who was the first emperor of China?',
      'options': ['Liu Bang', 'Qin Shi Huang', 'Kublai Khan', 'Genghis Khan'],
      'answer': 'Qin Shi Huang',
    },
    {
      'question': 'Which historical figure is known for his “I Have a Dream” speech?',
      'options': ['Martin Luther King Jr.', 'John F. Kennedy', 'Malcolm X', 'Nelson Mandela'],
      'answer': 'Martin Luther King Jr.',
    },
    {
      'question': 'When did the Berlin Wall fall?',
      'options': ['1972', '1989', '1991', '1965'],
      'answer': '1989',
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
          'History Category',
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