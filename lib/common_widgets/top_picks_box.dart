import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPicksBox extends StatelessWidget {
  const TopPicksBox({super.key, required this.iObj});
  final Map iObj;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                color: TColor.whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [BoxShadow(color: Colors.black38, offset: Offset(0, 2), blurRadius: 5)]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                iObj["img"].toString(),
                width: size.width * 0.32,
                height: size.width * 0.50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            iObj["name"].toString(),
            maxLines: 3,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: TColor.text),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            iObj["author"].toString(),
            maxLines: 1,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w700, color: TColor.subTitle),
          ),
        ],
      ),
    );
  }
}
