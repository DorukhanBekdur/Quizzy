import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../result_page.dart';

class art_quiz_page extends StatefulWidget {
  @override
  _ArtQuizPageState createState() => _ArtQuizPageState();
}

class _ArtQuizPageState extends State<art_quiz_page> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Who painted the famous artwork "Mona Lisa"?',
      'options': ['Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Claude Monet'],
      'answer': 'Leonardo da Vinci',
    },
    {
      'question': 'In which city can you find the museum that houses "The Starry Night" by Vincent van Gogh?',
      'options': ['Paris', 'Amsterdam', 'New York', 'Madrid'],
      'answer': 'New York',
    },
    {
      'question': 'Which artist is known for his "Campbell’s Soup Cans" artwork?',
      'options': ['Andy Warhol', 'Jackson Pollock', 'Mark Rothko', 'Roy Lichtenstein'],
      'answer': 'Andy Warhol',
    },
    {
      'question': 'Who painted the ceiling of the Sistine Chapel?',
      'options': ['Leonardo da Vinci', 'Michelangelo', 'Raphael', 'Caravaggio'],
      'answer': 'Michelangelo',
    },
    {
      'question': 'Which art movement is Pablo Picasso associated with?',
      'options': ['Impressionism', 'Surrealism', 'Cubism', 'Expressionism'],
      'answer': 'Cubism',
    },
    {
      'question': 'What is the famous "The Persistence of Memory" painting by Salvador Dalí often referred to as?',
      'options': ['The Melting Clocks', 'The Last Supper', 'The Electric Dreams', 'The Daydream'],
      'answer': 'The Melting Clocks',
    },
    {
      'question': 'Which famous artist painted "The Girl with a Pearl Earring"?',
      'options': ['Rembrandt', 'Johannes Vermeer', 'Vincent van Gogh', 'Claude Monet'],
      'answer': 'Johannes Vermeer',
    },
    {
      'question': 'Which period did the artist Claude Monet belong to?',
      'options': ['Baroque', 'Renaissance', 'Impressionism', 'Surrealism'],
      'answer': 'Impressionism',
    },
    {
      'question': 'Who painted "Guernica", which represents the horrors of the Spanish Civil War?',
      'options': ['Diego Rivera', 'Pablo Picasso', 'Frida Kahlo', 'Georges Braque'],
      'answer': 'Pablo Picasso',
    },
    {
      'question': 'What is the name of the famous sculpture by Michelangelo that depicts a biblical hero?',
      'options': ['David', 'Venus de Milo', 'The Thinker', 'The Kiss'],
      'answer': 'David',
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
          'Art Category',
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