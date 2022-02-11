import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/services/models.dart';
import 'package:test/quiz/quiz_list.dart';

class TopicDrawer extends StatelessWidget {
  final List<Topic> topics;

  const TopicDrawer({Key? key, required this.topics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int idx) {
          Topic topic = topics[idx];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  topic.title,
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ),
              QuizList(topic: topic)
            ],
          );
        },
        separatorBuilder: (BuildContext context, int idx) => const Divider(),
        itemCount: topics.length,
        primary: false,
      ),
    );
  }
}
