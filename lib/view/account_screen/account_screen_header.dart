import 'package:book_store_app/common_widgets/headline.dart';
import 'package:book_store_app/common_widgets/tiny_button.dart';
import 'package:book_store_app/common_widgets/tiny_headline.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:book_store_app/view/account_screen/stats_widget.dart';
import 'package:flutter/material.dart';

class AccountScreenHeader extends StatelessWidget {
  const AccountScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyHeadline(headline: 'Will Newman'),
                    const TinyHeadline(tinyHeadline: 'Constantly travelling and keeping up to date with business related books')
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      "assets/images/u1.png",
                      width: 70,
                      height: 70,
                    )),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.near_me_sharp,
                  color: TColor.subTitle,
                  size: 15,
                ),
                Expanded(
                    child: Text(
                  "Newcastle - Australia",
                  style: TextStyle(color: TColor.subTitle, fontSize: 13),
                )),
                const SizedBox(
                  width: 8,
                ),
                TinyButton(
                  buttonText: 'Edit Profie',
                  buttonGradiance: TColor.primatyButton,
                  shadowColor: TColor.primary,
                  buttonTextColor: TColor.whiteColor,
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Stats(number: '21', label: 'Books'),
                SizedBox(width: 20),
                Stats(number: '5', label: 'Reviews'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
