import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewBox extends StatelessWidget {
  const ReviewBox({super.key, required this.rObj});
  final Map rObj;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  rObj["description"].toString(),
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.normal, color: TColor.text),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Read more >",
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.normal, color: TColor.subTitle.withOpacity(.3)),
                ),
                const SizedBox(
                  height: 8,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: RatingBar.builder(
                    initialRating: double.tryParse(rObj["rating"].toString()) ?? 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: TColor.primary,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
              ],
              //text
              //rating
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child:
                Image.asset(rObj["img"].toString(), width: size.width * 0.15, height: size.width * 0.15 * 1.6, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
