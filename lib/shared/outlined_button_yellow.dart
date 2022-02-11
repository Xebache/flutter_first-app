import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlinedButtonYellow extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const OutlinedButtonYellow({Key? key, required this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.white,
                shape: const StadiumBorder(),
                side: const BorderSide(width: 2, color: Color.fromARGB(255, 194, 155, 12)),
                padding: const EdgeInsets.all(20),
                textStyle: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                    fontFamily: GoogleFonts.poppins().fontFamily)),
            child: Text(text),
            onPressed: onPressed));
  }
}
