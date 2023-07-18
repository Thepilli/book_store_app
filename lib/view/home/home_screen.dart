import 'package:book_store_app/common_widgets/bestsellers_box.dart';
import 'package:book_store_app/common_widgets/genres_box.dart';
import 'package:book_store_app/common_widgets/headline.dart';
import 'package:book_store_app/common_widgets/newsletter_footer.dart';
import 'package:book_store_app/common_widgets/recently_viewed_box.dart';
import 'package:book_store_app/common_widgets/top_picks_box.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List topPicksArr = [
    {"name": "The Dissapearance of Emila Zola", "author": "Michael Rosen", "img": "assets/images/1.jpg"},
    {"name": "Fatherhood", "author": "Marcus Berkmann", "img": "assets/images/2.jpg"},
    {"name": "The Time Travellers Handbook", "author": "Stride Lottie", "img": "assets/images/3.jpg"}
  ];

  List bestArr = [
    {"name": "Fatherhood", "author": "by Christopher Wilson", "img": "assets/images/4.jpg", "rating": 5.0},
    {"name": "In A Land Of Paper Gods", "author": "by Rebecca Mackenzie", "img": "assets/images/5.jpg", "rating": 4.0},
    {"name": "Tattletale", "author": "by Sarah J. Noughton", "img": "assets/images/6.jpg", "rating": 3.0},
    {"name": "Fatherhood", "author": "by Christopher Wilson", "img": "assets/images/4.jpg", "rating": 5.0},
    {"name": "In A Land Of Paper Gods", "author": "by Rebecca Mackenzie", "img": "assets/images/5.jpg", "rating": 4.0},
    {"name": "Tattletale", "author": "by Sarah J. Noughton", "img": "assets/images/6.jpg", "rating": 3.0},
    {"name": "Fatherhood", "author": "by Christopher Wilson", "img": "assets/images/4.jpg", "rating": 5.0},
    {"name": "In A Land Of Paper Gods", "author": "by Rebecca Mackenzie", "img": "assets/images/5.jpg", "rating": 4.0},
    {"name": "Tattletale", "author": "by Sarah J. Noughton", "img": "assets/images/6.jpg", "rating": 3.0},
  ];

  List genresArr = [
    {
      "name": "Graphic Novels",
      "img": "assets/images/g1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/images/g1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/images/g1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/images/g1.png",
    },
    {
      "name": "Graphic Novels",
      "img": "assets/images/g1.png",
    }
  ];

  List recentArr = [
    {"name": "The Fatal Tree", "author": "by Jake Arnott", "img": "assets/images/10.jpg"},
    {"name": "Day Four", "author": "by LOTZ, SARAH", "img": "assets/images/11.jpg"},
    {"name": "Door to Door", "author": "by Edward Humes", "img": "assets/images/12.jpg"},
    {"name": "The Fatal Tree", "author": "by Jake Arnott", "img": "assets/images/10.jpg"},
    {"name": "Day Four", "author": "by LOTZ, SARAH", "img": "assets/images/11.jpg"},
    {"name": "Door to Door", "author": "by Edward Humes", "img": "assets/images/12.jpg"},
    {"name": "The Fatal Tree", "author": "by Jake Arnott", "img": "assets/images/10.jpg"},
    {"name": "Day Four", "author": "by LOTZ, SARAH", "img": "assets/images/11.jpg"},
    {"name": "Door to Door", "author": "by Edward Humes", "img": "assets/images/12.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  child: Transform.scale(
                    scale: 1.5,
                    origin: Offset(0, size.width) * .8,
                    child: Container(
                      width: size.width,
                      height: size.width,
                      decoration: BoxDecoration(color: TColor.primary, borderRadius: BorderRadius.circular(size.width)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: Container(),
                      leadingWidth: 1,
                      title: Row(
                        children: [
                          MyHeadline(headline: 'Our Top Picks'),
                        ],
                      ),
                      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.width * 0.8,
                      child: CarouselSlider.builder(
                          itemCount: topPicksArr.length,
                          itemBuilder: (context, itemIndex, pageViewIndex) {
                            var iObj = topPicksArr[itemIndex] as Map? ?? {};
                            return TopPicksBox(iObj: iObj);
                          },
                          options: CarouselOptions(
                            autoPlay: false,
                            aspectRatio: 1,
                            enlargeCenterPage: true,
                            viewportFraction: 0.45,
                            enlargeFactor: 0.4,
                            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                          )),
                    ),
                    MyHeadline(headline: 'Bestsellers'),
                    SizedBox(
                      height: size.width * 0.1 / 2,
                    ),
                    SizedBox(
                      height: size.width * .9,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: bestArr.length,
                        itemBuilder: (BuildContext context, int index) {
                          var iObj = bestArr[index] as Map? ?? {};
                          return GestureDetector(onTap: () {}, child: BestsellersBox(iObj: iObj));
                        },
                      ),
                    ),
                    MyHeadline(headline: 'Genres'),
                    SizedBox(
                      height: size.width * 0.1 / 2,
                    ),
                    SizedBox(
                      height: size.width * .6,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: genresArr.length,
                        itemBuilder: (BuildContext context, int index) {
                          var iObj = genresArr[index] as Map? ?? {};
                          return GenresBox(
                            iObj: iObj,
                            bgcolor: index % 2 == 0 ? TColor.color1 : TColor.color2,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.1,
                    ),
                    MyHeadline(headline: 'Recently Viewed'),
                    SizedBox(
                      height: size.width * 0.1 / 2,
                    ),
                    SizedBox(
                      height: size.width * .7,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recentArr.length,
                        itemBuilder: (BuildContext context, int index) {
                          var iObj = recentArr[index] as Map? ?? {};
                          return RecentlyViewedBox(
                            iObj: iObj,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.1,
                    ),
                    MyHeadline(headline: 'Monthly Newsletter'),
                    SizedBox(
                      height: size.width * 0.1 / 2,
                    ),
                    const NewsletterForm()
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
