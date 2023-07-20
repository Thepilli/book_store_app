import 'package:book_store_app/common_widgets/material_button.dart';
import 'package:book_store_app/common_widgets/tiny_headline.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchFilterView extends StatefulWidget {
  final Function(Map)? didFilter;
  const SearchFilterView({super.key, this.didFilter});

  @override
  State<SearchFilterView> createState() => _SearchFilterViewState();
}

class _SearchFilterViewState extends State<SearchFilterView> {
  TextEditingController searchController = TextEditingController();

  int selectedSort = 0;
  int selectedGenre = 0;
  int selectedRating = 0;
  bool genreShowMore = false;

  List sortByArr = ["Featured Titles", "Price: Low to High", "Price: High to Low", "Publication Date", "A - Z"];
  List genreArr = [
    "Biography",
    "Business & Economics",
    "Children",
    "Cookery",
    "Fiction",
    "Biography1",
    "Business & Economics1",
    "Children1",
    "Cookery1",
    "Fiction1"
  ];

  List ratingArr = [5.0, 4.0, 3.0, 2.0, 1.0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: TColor.textbox, borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: TColor.text),
                    hintText: "Search here",
                    labelStyle: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.normal, color: TColor.text),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: TColor.text,
                  ),
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TinyHeadline(tinyHeadline: 'Sort by'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              itemCount: sortByArr.length,
              itemBuilder: (context, index) {
                var itemName = sortByArr[index] as String? ?? '';
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        selectedSort = index;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(selectedSort == index ? Icons.radio_button_checked : Icons.radio_button_off,
                            color: selectedSort == index ? TColor.primary : TColor.subTitle),
                        const SizedBox(width: 40),
                        Text(itemName)
                      ],
                    ),
                  ),
                );
              },
            ),
            const TinyHeadline(tinyHeadline: 'Genre'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              itemCount: genreShowMore ? genreArr.length : (genreArr.length > 5 ? 5 : genreArr.length),
              itemBuilder: (context, index) {
                var itemName = genreArr[index] as String? ?? '';
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        selectedGenre = index;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(selectedGenre == index ? Icons.radio_button_checked : Icons.radio_button_off,
                            color: selectedGenre == index ? TColor.primary : TColor.subTitle),
                        const SizedBox(width: 40),
                        Text(itemName)
                      ],
                    ),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  genreShowMore = !genreShowMore;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Row(
                  children: [
                    Icon(genreShowMore ? Icons.expand_less : Icons.expand_more, color: TColor.subTitle),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Text(
                      genreShowMore ? "Hide" : "See more",
                      style: TextStyle(color: TColor.subTitle, fontSize: 15),
                    )),
                  ],
                ),
              ),
            ),
            const TinyHeadline(tinyHeadline: 'Average Customer Review'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              itemCount: ratingArr.length,
              itemBuilder: (context, index) {
                var itemName = ratingArr[index] as double? ?? 1.0;
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        selectedRating = index;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(selectedRating == index ? Icons.radio_button_checked : Icons.radio_button_off,
                            color: selectedRating == index ? TColor.primary : TColor.subTitle),
                        const SizedBox(width: 40),
                        IgnorePointer(
                          ignoring: true,
                          child: RatingBar.builder(
                            initialRating: itemName,
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
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, -5),
            ),
          ]),
          child: MyMaterialButton(
              buttonText: 'Apply',
              onPressed: () {
                Navigator.pop(context);
              },
              isEnabled: true)),
    );
  }
}
