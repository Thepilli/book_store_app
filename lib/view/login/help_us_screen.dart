// ignore_for_file: prefer_const_constructors

import 'package:book_store_app/common_widgets/dropdown_button.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:book_store_app/view/main_tab/main_tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpUsScreen extends StatefulWidget {
  const HelpUsScreen({Key? key}) : super(key: key);

  @override
  State<HelpUsScreen> createState() => _HelpUsScreenState();
}

class _HelpUsScreenState extends State<HelpUsScreen> {
  String? selectedState; // Declare a variable to store the selected state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      appBar: AppBar(
        backgroundColor: TColor.whiteColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: TColor.primary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help Up Help You',
                style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700, color: TColor.blackColor),
              ),
              const SizedBox(height: 15),
              Text(
                'It seems as this is your first time using our app, please enter your location so we can filter our results and stock accordingly to your local store',
                style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.normal, color: TColor.subTitle),
              ),
              Text(
                'If you choose to skip, you can change your location at any time in your account settings',
                style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.normal, color: TColor.subTitle),
              ),
              const SizedBox(height: 15),
              MyDropdownButton(hint: 'hint', items: const ['Select a state', 'State1', 'State2', 'State3']),
              const SizedBox(height: 15),
              MyDropdownButton(hint: 'hint', items: const ['Select a city', 'City1', 'City2', 'City3']),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MainTabView()));
                    },
                    child: Text(
                      'skip',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w700, color: TColor.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
