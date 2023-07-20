import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OurBooksScreen extends StatefulWidget {
  const OurBooksScreen({super.key});

  @override
  State<OurBooksScreen> createState() => _OurBooksScreenState();
}

class _OurBooksScreenState extends State<OurBooksScreen> {
  List imageArr = ["assets/images/ob1.png", "assets/images/ob2.png", "assets/images/ob3.png"];

  final String description =
      "The Book Grocer online offers a broad and ever increasing range of discounted remainder and secondhand books.\n\nOur specialty is sourcing discounted books of amazing quality and passing on to our customers the best possible price.\nWe take our book buying very seriously indeed. We scour the globe and the best publishers and suppliers for the best bargains, but no book simply arrives in our warehouse simply because it's cheap. It has to be something we want to read ourselves and would reccomend to others.\nWe like to be known as the business which sells discounted books yet looks and feels like a retail bookstore.\n\nWe are an Australian, family-owned business. We have been buying and selling books since 2000, when the first Castlebooks store opened in Kingston, ACT.\n\nIn 2007 we opened the first Book Grocer in Brunswick, Victoria. Book Grocers can now be found in a range of locations across Victoria, NSW, and of course, Canberra.\n\nOur staff also love reading and recommending books to others and we are proud of the role they play in demonstrating to our customers how good discount books can be.";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/our_books_top.png',
                  width: size.width,
                  fit: BoxFit.fitWidth,
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: SizedBox(
                    height: 150,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageArr.length,
                      itemBuilder: (BuildContext context, int index) {
                        var iObj = imageArr[index] as String? ?? '';
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
                              BoxShadow(color: TColor.blackColor.withOpacity(.5), offset: const Offset(2, 4), blurRadius: 4)
                            ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                iObj,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: TColor.blackColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
