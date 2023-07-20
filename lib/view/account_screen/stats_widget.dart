import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  final String number;
  final String label;
  const Stats({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(color: TColor.subTitle, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: TextStyle(color: TColor.subTitle, fontSize: 11),
        )
      ],
    );
  }
}
