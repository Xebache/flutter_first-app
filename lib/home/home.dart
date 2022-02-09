import 'package:flutter/material.dart';
import 'package:test/login/login.dart';
import 'package:test/services/auth.dart';
import 'package:test/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().useStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading');
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          } else if (snapshot.hasData) {
            return const TopicsScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}


  // return Scaffold(
  //       body: Center(
  //           child: Column(
  //     mainAxisSize: MainAxisSize.max,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       OutlinedButtonYellow(text: 'Profile', onPressed: () => Navigator.pushNamed(context, 'profile')),
  //       OutlinedButtonYellow(text: 'Quiz', onPressed: () => Navigator.pushNamed(context, 'quiz')),
  //       OutlinedButtonYellow(text: 'Topics', onPressed: () => Navigator.pushNamed(context, 'topics')),
  //     ],
  //   )));

