import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TinyHeadline extends StatelessWidget {
  const TinyHeadline({super.key, required this.tinyHeadline});
  final String tinyHeadline;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        tinyHeadline,
        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: TColor.subTitle),
      ),
    );
  }
}
