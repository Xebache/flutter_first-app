import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/services/models.dart';

class TopicScreen extends StatelessWidget {
  final Topic topic;

  const TopicScreen({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Hero(
          tag: topic.img,
          child: Image.asset('covers/${topic.img}', width: MediaQuery.of(context).size.width),
        ),
        Text(
          topic.title,
          style: TextStyle(
              height: 1.5, fontWeight: FontWeight.w100, fontFamily: GoogleFonts.poppins().fontFamily),
        )
      ]),
    );
  }
}
