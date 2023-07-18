import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMaterialButton extends StatelessWidget {
  const MyMaterialButton({super.key, required this.buttonText, required this.onPressed, required this.isEnabled});
  final String buttonText;
  final VoidCallback? onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        disabledColor: TColor.primary.withOpacity(.3),
        onPressed: isEnabled ? onPressed : null,
        color: TColor.primary,
        textColor: TColor.whiteColor,
        height: 50,
        minWidth: double.maxFinite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
