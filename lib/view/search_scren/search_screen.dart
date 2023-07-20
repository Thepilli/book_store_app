import 'package:book_store_app/common_widgets/history_box.dart';
import 'package:book_store_app/common_widgets/search_grid_cell.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:book_store_app/constants/extensions.dart';
import 'package:book_store_app/view/search_scren/search_filter_screen.dart';
import 'package:book_store_app/view/search_scren/search_force_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  int selectedTag = 0;
  List tagsArr = ["Genre", "New Release", "The Art", "Genre1", "New Release1", "The Art1"];

  List searchArr = [
    {
      "name": "Biography",
      "img": "assets/images/b1.jpg",
    },
    {
      "name": "Business",
      "img": "assets/images/b2.jpg",
    },
    {
      "name": "Children",
      "img": "assets/images/b3.jpg",
    },
    {
      "name": "Cookery",
      "img": "assets/images/b4.jpg",
    },
    {
      "name": "Fiction",
      "img": "assets/images/b5.jpg",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/images/b6.jpg",
    },
    {
      "name": "Biography",
      "img": "assets/images/b1.jpg",
    },
    {
      "name": "Business",
      "img": "assets/images/b2.jpg",
    },
    {
      "name": "Children",
      "img": "assets/images/b3.jpg",
    },
    {
      "name": "Cookery",
      "img": "assets/images/b4.jpg",
    },
    {
      "name": "Fiction",
      "img": "assets/images/b5.jpg",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/images/b6.jpg",
    }
  ];

  List sResultArr = [
    {
      "name": "The Heart of Hell",
      "img": "assets/images/h1.jpg",
      "author": "Mitch Weiss",
      "description": "The untold story of courage and sacrifice in the shadow of Iwo Jima.",
      "rating": 5.0
    },
    {
      "name": "Adrennes 1944",
      "img": "assets/images/h2.jpg",
      "author": "Antony Beevor",
      "description": "#1 international bestseller and award winning history book.",
      "rating": 4.0
    },
    {
      "name": "War on the Gothic Line",
      "img": "assets/images/h3.jpg",
      "author": "Christian Jennings",
      "description": "Through the eyes of thirteen men and women from seven different nations",
      "rating": 3.0
    },
    {
      "name": "The Heart of Hell",
      "img": "assets/images/h1.jpg",
      "author": "Mitch Weiss",
      "description": "The untold story of courage and sacrifice in the shadow of Iwo Jima.",
      "rating": 5.0
    },
    {
      "name": "Adrennes 1944",
      "img": "assets/images/h2.jpg",
      "author": "Antony Beevor",
      "description": "#1 international bestseller and award winning history book.",
      "rating": 4.0
    },
    {
      "name": "War on the Gothic Line",
      "img": "assets/images/h3.jpg",
      "author": "Christian Jennings",
      "description": "Through the eyes of thirteen men and women from seven different nations",
      "rating": 3.0
    },
    {
      "name": "The Heart of Hell",
      "img": "assets/images/h1.jpg",
      "author": "Mitch Weiss",
      "description": "The untold story of courage and sacrifice in the shadow of Iwo Jima.",
      "rating": 5.0
    },
    {
      "name": "Adrennes 1944",
      "img": "assets/images/h2.jpg",
      "author": "Antony Beevor",
      "description": "#1 international bestseller and award winning history book.",
      "rating": 4.0
    },
    {
      "name": "War on the Gothic Line",
      "img": "assets/images/h3.jpg",
      "author": "Christian Jennings",
      "description": "Through the eyes of thirteen men and women from seven different nations",
      "rating": 3.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        leadingWidth: 1,
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: TColor.textbox, borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: searchController,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchForceView(
                          didSearch: (sText) {
                            searchController.text = sText;
                            if (mounted) {
                              setState(() {});
                            }
                          },
                        ),
                      ),
                    );
                    endEditing();
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: TColor.text),
                    suffixIcon: SizedBox(
                      width: 40,
                      child: IconButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchFilterView(
                                  didFilter: (fObj) {
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  },
                                ),
                              ),
                            );
                            endEditing();
                          },
                          icon: Icon(Icons.tune, color: TColor.text)),
                    ),
                    hintText: "Search Books. Authors. or ISBN",
                    labelStyle: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.normal, color: TColor.text),
                  ),
                ),
              ),
            ),
            if (searchController.text.isNotEmpty)
              const SizedBox(
                width: 8,
              ),
            if (searchController.text.isNotEmpty)
              TextButton(
                onPressed: () {
                  searchController.text = "";
                  setState(() {});
                },
                child: Text(
                  "Cancel",
                  style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.normal, color: TColor.text),
                ),
              )
          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,

                //children are not in [], but .tolist()
                children: tagsArr.map(
                  (tagName) {
                    var index = tagsArr.indexOf(tagName);
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTag = index;
                          });
                        },
                        child: Text(
                          tagName,
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: selectedTag == index ? TColor.text : TColor.subTitle),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          if (searchController.text.isEmpty)
            Expanded(
              child: GridView.builder(
                itemCount: searchArr.length,
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .75,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  var sObj = searchArr[index] as Map? ?? {};
                  return SearchGridCell(sObj: sObj, index: index);
                },
              ),
            ),
          if (searchController.text.isNotEmpty)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: sResultArr.length,
                itemBuilder: (BuildContext context, int index) {
                  var sObj = sResultArr[index] as Map? ?? {};
                  return HistoryBox(sObj: sObj);
                },
              ),
            ),
        ],
      ),
    );
  }
}
