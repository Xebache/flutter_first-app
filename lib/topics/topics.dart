import 'package:flutter/material.dart';

import '../shared/nav/bottom_nav.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Topics'),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
