import 'package:flutter/material.dart';
import 'package:test/services/firestore.dart';
import 'package:test/services/models.dart';
import 'package:test/shared/shared.dart';
import 'package:test/topics/topic_drawer.dart';
import 'package:test/topics/topic_item.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          } else if (snapshot.hasError) {
            return const SafeArea(
                child: CustomSnackBar.error(
              message: "Something went wrong.",
            ));
          } else if (snapshot.hasData) {
            var topics = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Topics'),
              ),
              drawer: TopicDrawer(topics: topics),
              body: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  padding: const EdgeInsets.all(10),
                  children: topics.map((topic) => TopicItem(topic: topic)).toList()),
              bottomNavigationBar: const BottomNav(),
            );
          } else {
            return const Text('no data to show');
          }
        });
  }
}
