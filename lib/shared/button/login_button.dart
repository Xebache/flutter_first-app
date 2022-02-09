import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function login;

  const LoginButton(
      {Key? key, required this.color, required this.icon, required this.text, required this.login})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton.icon(
          icon: Icon(icon, color: Colors.white, size: 20),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(24),
            backgroundColor: color,
          ),
          onPressed: () => login(),
          label: Text(text, textAlign: TextAlign.center),
        ));
  }
}
