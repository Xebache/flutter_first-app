import 'package:flutter/material.dart';

import 'customButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CustomButton(text: 'about', onPressed: () => Navigator.pushNamed(context, 'about'))));
  }
}
