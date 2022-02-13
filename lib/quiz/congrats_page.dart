import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/services/firestore.dart';
import 'package:test/services/models.dart';

class CongratsPage extends StatelessWidget {
  final Quiz quiz;
  const CongratsPage({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Congrats! Quiz ${quiz.title} is completed', textAlign: TextAlign.center),
          const Divider(),
          ElevatedButton.icon(
              onPressed: () {
                FirestoreService().updateUserReport(quiz);
                Navigator.pushNamedAndRemoveUntil(context, 'topics', (route) => false);
              },
              icon: const Icon(FontAwesomeIcons.check),
              label: const Text('Mark complete'))
        ],
      ),
    );
  }
}
