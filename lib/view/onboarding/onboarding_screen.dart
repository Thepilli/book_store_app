import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:book_store_app/view/onboarding/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int page = 0;

  final PageController pageController = PageController();
  List pageArr = [
    {
      "title": "Discounted\nSecondhand Books",
      "sub_title": "Used and near new secondhand books at great prices.",
      "img": "assets/images/on_1.png"
    },
    {
      "title": "20 Book Grocers\nNationally",
      "sub_title": "We've successfully opened 20 stores across Australia.",
      "img": "assets/images/on_2.png"
    },
    {
      "title": "Sell or Recycle Your Old\nBooks With Us",
      "sub_title": "If you're looking to downsize, sell or recycle old books, the Book Grocer can help.",
      "img": "assets/images/on_3.png"
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController.addListener(() {
      page = pageController.page?.round() ?? 0;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return Container(
                  width: size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                  child: Column(
                    children: [
                      Text(
                        pObj['title'].toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w600, color: TColor.primary),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        pObj['sub_title'].toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.normal, color: TColor.primary),
                      ),
                      const SizedBox(height: 15),
                      Image.asset(
                        pObj['img'].toString(),
                        width: size.width * .8,
                        height: size.width * .8,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomePage(),
                            ),
                          );
                        },
                        child: Text(
                          'skip',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w700, color: TColor.primary),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pageArr.map(
                          (e) {
                            var index = pageArr.indexOf(e);
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: page == index ? TColor.primary : TColor.primaryLight,
                                  borderRadius: BorderRadius.circular(5)),
                            );
                          },
                        ).toList(),
                      ),
                      TextButton(
                        onPressed: () {
                          if (page < 2) {
                            page = page + 1;
                            pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomePage(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'next',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w700, color: TColor.primary),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
