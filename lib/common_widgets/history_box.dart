import 'package:book_store_app/common_widgets/tiny_button.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryBox extends StatelessWidget {
  final Map sObj;
  const HistoryBox({super.key, required this.sObj});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:
                Image.asset(sObj["img"].toString(), width: size.width * 0.25, height: size.width * 0.25 * 1.6, fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(sObj["name"].toString(),
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w700, color: TColor.text)),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  sObj["author"].toString(),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.normal, color: TColor.subTitle),
                ),
                const SizedBox(
                  height: 8,
                ),
                IgnorePointer(
                  ignoring: true,
                  child: RatingBar.builder(
                    initialRating: double.tryParse(sObj["rating"].toString()) ?? 1,
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
                const SizedBox(
                  height: 8,
                ),
                Text(
                  sObj["description"].toString(),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.normal, color: TColor.subTitle.withOpacity(.3)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: TinyButton(
                      buttonText: 'Add to cart',
                      buttonGradiance: TColor.primatyButton,
                      shadowColor: TColor.primary,
                      buttonTextColor: TColor.whiteColor,
                      onPressed: () {},
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: TinyButton(
                      buttonText: 'Add to wishlist',
                      buttonGradiance: TColor.whiteButton,
                      shadowColor: TColor.blackColor.withAlpha(100),
                      buttonTextColor: TColor.text,
                      onPressed: () {},
                    )),
                    // button
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
