import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TinyButton extends StatelessWidget {
  final String buttonText;
  final Color buttonTextColor;
  final List<Color> buttonGradiance;
  final Color shadowColor;
  final VoidCallback onPressed;
  const TinyButton(
      {super.key,
      required this.buttonText,
      required this.buttonGradiance,
      required this.shadowColor,
      required this.buttonTextColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: buttonGradiance), borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: 5,
          offset: const Offset(0, 3),
        )
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500, color: buttonTextColor),
        ),
      ),
    );
  }
}
