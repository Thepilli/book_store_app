import 'package:flutter/material.dart';

class TColor {
  static Color get primary => const Color(0xff5ABD8C);
  static Color get primaryLight => const Color(0xffAFDFC7);
  static Color get text => const Color(0xff212121);
  static Color get subTitle => const Color(0xff212121).withOpacity(0.4);
  static Color get drawerColor => const Color(0xffffffff).withOpacity(0.9);

  static Color get color1 => const Color(0xff1C4A7E);
  static Color get color2 => const Color(0xffC65135);

  static Color get whiteColor => const Color(0xffffffff);
  static Color get blackColor => const Color(0xff000000);

  static Color get textbox => const Color(0xffEFEFEF).withOpacity(0.6);

  static List<Color> get primatyButton => const [
        Color(0xff5ABD8C),
        Color(0xff00FF81),
      ];
  static List<Color> get whiteButton => const [
        Color(0xffffffff),
        Color(0xFFF0F0F0),
      ];

  static List<Color> get searchBGColor => const [
        Color(0xffB7143C),
        Color(0xffE6A500),
        Color(0xffEF4C45),
        Color(0xffF46217),
        Color(0xff09ADE2),
        Color(0xffD36A43),
      ];
}
