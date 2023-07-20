import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchGridCell extends StatelessWidget {
  const SearchGridCell({super.key, required this.sObj, required this.index});
  final Map sObj;
  final int index;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
          color: TColor.searchBGColor[index % TColor.searchBGColor.length], borderRadius: BorderRadius.circular(15)),
      child: Column(children: [
        Text(
          sObj['name'].toString(),
          style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600, color: TColor.whiteColor),
        ),
        const SizedBox(height: 15),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            sObj["img"].toString(),
            width: size.width * 0.22,
            height: size.width * 0.22 * 1.6,
            fit: BoxFit.cover,
          ),
        ),
      ]),
    );
  }
}
