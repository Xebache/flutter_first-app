import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/shared/button/login_button.dart';

import '../services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: LoginButton(
            color: const Color.fromARGB(255, 194, 155, 12),
            icon: FontAwesomeIcons.signOutAlt,
            text: 'Log Out',
            login: () async {
              AuthService().signOut;
              Navigator.pushNamed(context, 'login');
            }));
  }
}
