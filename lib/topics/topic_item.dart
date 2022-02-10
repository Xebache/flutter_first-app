import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/services/models.dart';
import 'package:test/topics/topic_screen.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;

  const TopicItem({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: topic.img,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => TopicScreen(topic: topic),
                ));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 3,
                      child: SizedBox(
                          child: Image.asset(
                        'covers/${topic.img}',
                        fit: BoxFit.contain,
                      ))),
                  Flexible(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            topic.title,
                            style: TextStyle(
                                height: 1.5,
                                fontWeight: FontWeight.w100,
                                fontFamily: GoogleFonts.poppins().fontFamily),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          )))
                ],
              )),
        ));
  }
}
