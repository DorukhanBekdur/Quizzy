import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../result_page.dart';

class science_quiz_page extends StatefulWidget {
  @override
  _ScienceQuizPageState createState() => _ScienceQuizPageState();
}

class _ScienceQuizPageState extends State<science_quiz_page> {
  final List<Map<String, Object>> _questions = [
  {
  'question': 'What is the chemical symbol for water?',
  'options': ['H2O', 'O2', 'CO2', 'H2'],
  'answer': 'H2O',
},
{
'question': 'What planet is known as the Red Planet?',
'options': ['Earth', 'Venus', 'Mars', 'Jupiter'],
'answer': 'Mars',
},
{
'question': 'Who is known as the father of modern physics?',
'options': ['Albert Einstein', 'Isaac Newton', 'Galileo Galilei', 'Niels Bohr'],
'answer': 'Albert Einstein',
},
{
'question': 'Which gas do plants absorb from the atmosphere during photosynthesis?',
'options': ['Oxygen', 'Carbon dioxide', 'Nitrogen', 'Hydrogen'],
'answer': 'Carbon dioxide',
},
{
'question': 'What is the hardest natural substance on Earth?',
'options': ['Gold', 'Diamond', 'Iron', 'Granite'],
'answer': 'Diamond',
},
{
'question': 'Which part of the cell contains genetic material?',
'options': ['Nucleus', 'Mitochondria', 'Ribosomes', 'Cytoplasm'],
'answer': 'Nucleus',
},
{
'question': 'What is the speed of light in a vacuum?',
'options': ['300,000 km/s', '150,000 km/s', '1,000 km/s', '500 km/s'],
'answer': '300,000 km/s',
},
{
'question': 'What element does "O" represent on the periodic table?',
'options': ['Oxygen', 'Osmium', 'Oganesson', 'Oxalate'],
'answer': 'Oxygen',
},
{
'question': 'What is the name of the force that keeps objects bound to Earth?',
'options': ['Magnetism', 'Gravity', 'Friction', 'Inertia'],
'answer': 'Gravity',
},
{
'question': 'Which planet is the largest in our Solar System?',
'options': ['Earth', 'Saturn', 'Jupiter', 'Uranus'],
'answer': 'Jupiter',
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
          'Science Category',
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