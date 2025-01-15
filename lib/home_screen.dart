import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzy/art_quiz_page.dart';
import 'package:quizzy/history_quiz_page.dart';
import 'package:quizzy/music_quiz_page.dart';
import 'package:quizzy/science_quiz_page.dart';
import 'package:quizzy/sport_quiz_page.dart';
import 'package:quizzy/technology_quiz_page.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'name': 'Technology', 'color': Color(0xFF77B1F3), 'icon': 'assets/images/technology.png'},
    {'name': 'Science', 'color': Color(0xFFB6E3C9), 'icon': 'assets/images/science.png'},
    {'name': 'History', 'color': Color(0xFFEFB8C8), 'icon': 'assets/images/history.png'},
    {'name': 'Sport', 'color': Color(0xFFFFE19C), 'icon': 'assets/images/sports.png'},
    {'name': 'Music', 'color': Color(0xFFC9ADEB), 'icon': 'assets/images/music.png'},
    {'name': 'Art', 'color': Color(0xFFF6C99C), 'icon': 'assets/images/art.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quizzy - Categories',
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF89CFF0),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF89CFF0), // Soft pastel blue
              Color(0xFFBFD8EB), // Soft pastel light blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Category',
                style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      if (category['name'] == 'Technology') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => technology_quiz_page()));
                      } else if (category['name'] == 'Science') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => science_quiz_page()));
                      } else if (category['name'] == 'History') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => history_quiz_page()));
                      } else if (category['name'] == 'Sport') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => sport_quiz_page()));
                      } else if (category['name'] == 'Music') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => music_quiz_page()));
                      } else if (category['name'] == 'Art') {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => art_quiz_page()));
                      }
                    },
                    child: Card(
                      shape: CircleBorder(),
                      elevation: 5,
                      color: category['color'],
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                category['icon'],
                                fit: BoxFit.contain,
                                width: 90,
                                height: 90,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              category['name'],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}










