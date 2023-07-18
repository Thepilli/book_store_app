import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHeadline extends StatelessWidget {
  final String headline;
  Color? color = TColor.text;
  MyHeadline({super.key, required this.headline, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            headline,
            style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700, color: color),
          )
        ],
      ),
    );
  }
}
