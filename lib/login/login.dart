import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/services/auth.dart';
import 'package:test/shared/button/login_button.dart';
import 'package:test/shared/icon/my_flutter_app_icons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(fit: StackFit.passthrough, children: const [Icon(MyFlutterApp.logo, size: 150)]),
                Flexible(
                    child: LoginButton(
                        color: const Color.fromARGB(255, 194, 155, 12),
                        icon: FontAwesomeIcons.userNinja,
                        text: 'Continue as Guest',
                        login: AuthService().anonLogin)),
                Flexible(
                    child: LoginButton(
                        color: Colors.blue,
                        icon: FontAwesomeIcons.google,
                        text: 'Log in with Google',
                        login: AuthService().googleLogin))
              ],
            )));
  }
}
