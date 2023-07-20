// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:book_store_app/common_widgets/headline.dart';
import 'package:book_store_app/common_widgets/review_box.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:book_store_app/view/account_screen/account_screen_header.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List purArr = [
    "assets/images/p1.jpg",
    "assets/images/p2.jpg",
    "assets/images/p1.jpg",
    "assets/images/p2.jpg",
    "assets/images/p1.jpg",
    "assets/images/p2.jpg",
    "assets/images/p3.jpg"
  ];
  List sResultArr = [
    {
      "img": "assets/images/p1.jpg",
      "description": "A must read for everybody. This book taught me so many things about...",
      "rate": 5.0
    },
    {"img": "assets/images/p2.jpg", "description": "#1 international bestseller and award winning history book.", "rate": 4.0},
    {
      "img": "assets/images/p1.jpg",
      "description": "A must read for everybody. This book taught me so many things about...",
      "rate": 5.0
    },
    {"img": "assets/images/p2.jpg", "description": "#1 international bestseller and award winning history book.", "rate": 4.0},
    {
      "img": "assets/images/p1.jpg",
      "description": "A must read for everybody. This book taught me so many things about...",
      "rate": 5.0
    },
    {"img": "assets/images/p2.jpg", "description": "#1 international bestseller and award winning history book.", "rate": 4.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: TColor.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountScreenHeader(),
            const SizedBox(height: 20),
            MyHeadline(headline: 'Your purchases (21)'), //obviously needs to be dynamic
            const SizedBox(height: 12),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: 150,
                  width: 150,
                ),
                Container(
                  color: Colors.transparent,
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: purArr.length,
                    itemBuilder: (BuildContext context, int index) {
                      var pObj = purArr[index] as String? ?? '';
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [BoxShadow(color: Colors.black38, offset: Offset(0, 2), blurRadius: 5)]),
                            child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(pObj.toString()))),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            MyHeadline(headline: 'Your reviews (7)'), //obviously needs to be dynamic

            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
              itemCount: sResultArr.length,
              itemBuilder: (context, index) {
                var rObj = sResultArr[index] as Map? ?? {};
                return ReviewBox(rObj: rObj);
              },
            )
          ],
        ),
      ),
    );
  }
}
