import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchForceView extends StatefulWidget {
  final Function(String)? didSearch;

  const SearchForceView({super.key, this.didSearch});

  @override
  State<SearchForceView> createState() => _SearchForceViewState();
}

class _SearchForceViewState extends State<SearchForceView> {
  TextEditingController searchController = TextEditingController();

  List perviousArr = ["Recent Search 1", "Recent Search 2", "Recent Search 3", "Recent Search 4", "Recent Search 5"];
  List resultArr = ["Gross Anatomy", "When To Rob A Bank", "The Bite In The Apple", "The Ignorant Maestro"];

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
                  controller: searchController,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (searchController.text.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                "Previous Searches",
                style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w700, color: TColor.subTitle),
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              itemCount: searchController.text.isEmpty ? perviousArr.length : resultArr.length,
              itemBuilder: (context, index) {
                var searchResultText = (searchController.text.isEmpty ? perviousArr : resultArr)[index] as String? ?? "";
                return GestureDetector(
                  onTap: () {
                    if (widget.didSearch != null) {
                      widget.didSearch!(searchResultText);
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: TColor.subTitle),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                            child: Text(
                          searchResultText,
                          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.normal, color: TColor.text),
                        )),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "times",
                          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.normal, color: TColor.primaryLight),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
