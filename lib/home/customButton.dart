import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButton({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: Colors.white,
            shape: const StadiumBorder(),
            side: const BorderSide(width: 2, color: Color.fromARGB(255, 194, 155, 12)),
            textStyle: const TextStyle(letterSpacing: 1.5, fontSize: 14, fontWeight: FontWeight.bold)),
        child: Text(text),
        onPressed: onPressed);
  }
}
