import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test/quiz/quizState.dart';
import 'package:test/services/models.dart';

class StartPage extends StatelessWidget {
  final Quiz quiz;
  const StartPage({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<QuizState>(context);
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              quiz.title,
              style: TextStyle(
                  height: 1.5, fontWeight: FontWeight.w100, fontFamily: GoogleFonts.poppins().fontFamily),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: state.nextPage, label: const Text('Start Quiz'), icon: const Icon(Icons.poll))
              ],
            )
          ],
        ));
  }
}
