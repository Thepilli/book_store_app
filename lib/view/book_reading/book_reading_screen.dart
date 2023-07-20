import 'dart:math';

import 'package:book_store_app/common_widgets/dropdown_button.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BookReadingScreen extends StatefulWidget {
  final Map iObj;
  const BookReadingScreen({super.key, required this.iObj});

  @override
  State<BookReadingScreen> createState() => _BookReadingScreenState();
}

class _BookReadingScreenState extends State<BookReadingScreen> {
  void updateUi() {
    setState(() {});
  }

  double fontSize = 30;
  double brightness = 20;
  bool isDark = false;
  final String texterino =
      "SHORTLY AFTER DARK ON THE AFTERNOON OF DECEMBER 5, 1997, an urgent message was relayed to a man named Yuri Trush at his home in Luchegorsk, a mid-sized mining town in Primorye Territory in Russia’s Far East, not far from the Chinese border. Primorye (Pri-mor-ya) is, among other things, the last stronghold of the Siberian tiger, and the official on the line had some disturbing news: a man had been attacked near Sobolonye, a small logging community located in the deep forest, sixty miles northeast of Luchegorsk. Yuri Trush was the squad leader of an Inspection Tiger unit, one of six in the territory whose purpose was to investigate forest crimes, specifically those involving tigers.\n\nBecause poachers were often involved, these included tiger attacks. As a result, this situation—whatever it might entail—was now Trush’s problem and, right away, he began preparing for the trip to Sobolonye.\n\nEarly the following morning—Saturday—Yuri Trush, along with his squadmates Alexander Gorborukov and Sasha Lazurenko, piled into a surplus army truck and rumbled north. Dressed in insulated fatigues and camouflage, and armed with knives, pistols, and semiautomatic rifles, the Tigers, as these inspectors are sometimes called, looked less like game wardens than like some kind of wilderness SWAT team. Their twenty-year-old truck was nicknamed a Kung, and it was the Russian army’s four-ton equivalent to the Unimog and the Humvee. Gasoline-powered, with a winch, four-wheel-drive, and wide waist-high tires, it is a popular vehicle in Primorye’s hinterlands.\n\nAlong with a gun rack and brackets forextra fuel cans, this one had been modified to accommodate makeshift bunks, and was stocked with enough food to last four men a week.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isDark ? TColor.blackColor : TColor.whiteColor,
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: false,
                  floating: false,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  foregroundColor: isDark ? TColor.primary : TColor.text,
                  title: Text(
                    widget.iObj['name'],
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w600, color: isDark ? TColor.whiteColor : TColor.text),
                  ),
                  actions: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Switch(
                          activeColor: TColor.primary,
                          value: isDark,
                          onChanged: (value) {
                            setState(() {
                              isDark = value;
                            });
                          },
                        ),
                        Text(
                          'Dark',
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w600, color: isDark ? TColor.primary : TColor.text),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  var orientation = MediaQuery.of(context).orientation;

                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: orientation == Orientation.portrait ? 25 : 60),
                                    decoration: BoxDecoration(
                                        color: TColor.whiteColor,
                                        borderRadius:
                                            const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: Icon(
                                              Icons.close,
                                              color: TColor.text,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.text_decrease, color: TColor.text),
                                              Expanded(
                                                child: StatefulBuilder(
                                                  builder: (BuildContext context, setState) {
                                                    return Slider(
                                                      divisions: 24,
                                                      label: fontSize.round().toString(),
                                                      activeColor: TColor.text,
                                                      inactiveColor: TColor.subTitle,
                                                      thumbColor: Colors.white,
                                                      min: 10.0,
                                                      max: 72.0,
                                                      value: fontSize,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          fontSize = value;
                                                        });
                                                        updateUi();
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              Icon(Icons.text_increase, color: TColor.text),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          const MyDropdownButton(
                                              hint: 'Change font', items: ['Change font', 'Font 1', 'Font 2', 'Font 3']),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.light_mode_outlined, size: 20, color: TColor.text),
                                              Expanded(
                                                child: StatefulBuilder(
                                                  builder: (BuildContext context, setState) {
                                                    return Slider(
                                                      activeColor: TColor.text,
                                                      inactiveColor: TColor.subTitle,
                                                      thumbColor: Colors.white,
                                                      min: 10.0,
                                                      max: 72.0,
                                                      value: brightness,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          brightness = value;
                                                        });
                                                        updateUi();
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                              Icon(Icons.light_mode, size: 30, color: TColor.text),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  decoration: orientation == Orientation.portrait
                                                      ? BoxDecoration(
                                                          color: TColor.blackColor.withOpacity(.1),
                                                          borderRadius: BorderRadius.circular(90))
                                                      : null,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        SystemChrome.setPreferredOrientations(
                                                            [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
                                                      },
                                                      icon: const Icon(Icons.phone_android))),
                                              const SizedBox(width: 15),
                                              Container(
                                                decoration: orientation == Orientation.landscape
                                                    ? BoxDecoration(
                                                        color: TColor.blackColor.withOpacity(.1),
                                                        borderRadius: BorderRadius.circular(90))
                                                    : null,
                                                child: Transform.rotate(
                                                    angle: pi / 2.0,
                                                    child: IconButton(
                                                        onPressed: () {
                                                          SystemChrome.setPreferredOrientations([
                                                            DeviceOrientation.landscapeLeft,
                                                            DeviceOrientation.landscapeRight
                                                          ]);
                                                        },
                                                        icon: const Icon(Icons.phone_android))),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.settings,
                            color: isDark ? TColor.primary : TColor.text,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                )
              ];
            },
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: SelectableText(
                texterino,
                style: GoogleFonts.poppins(
                    fontSize: fontSize, fontWeight: FontWeight.normal, color: isDark ? TColor.whiteColor : TColor.text),
              ),
            )));
  }
}
