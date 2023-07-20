import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:book_store_app/view/account_screen/account_screen.dart';
import 'package:book_store_app/view/home/home_screen.dart';
import 'package:book_store_app/view/out_books/our_books_screen.dart';
import 'package:book_store_app/view/search_scren/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView> with TickerProviderStateMixin {
  TabController? tabController;

  int selectedMenu = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  List menuArr = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Our Books", "icon": Icons.book},
    {"name": "Our Stores", "icon": Icons.storefront},
    {"name": "Careers", "icon": Icons.business_center},
    {"name": "Sell With Us", "icon": Icons.attach_money},
    {"name": "Newsletter", "icon": Icons.newspaper},
    {"name": "Pop-up Leasing", "icon": Icons.open_in_new},
    {"name": "Account", "icon": Icons.account_circle}
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        elevation: 0, //removes the shadow effect
        backgroundColor: Colors.transparent,
        width: size.width * .75,
        child: Container(
          decoration: BoxDecoration(
            color: TColor.drawerColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(size.width * .7),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 80),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: menuArr.map((mObj) {
                    var index = menuArr.indexOf(mObj);
                    return Container(
                      decoration: selectedMenu == index
                          ? BoxDecoration(
                              color: TColor.primary,
                              boxShadow: [BoxShadow(color: TColor.primary, blurRadius: 10, offset: const Offset(0, 3))])
                          : null,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            if (index == 1) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const OurBooksScreen()));
                              sideMenuScaffoldKey.currentState?.closeEndDrawer();
                            }
                            if (index == 7) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountScreen()));
                              sideMenuScaffoldKey.currentState?.closeEndDrawer();
                            }
                            selectedMenu = index;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              mObj['name'].toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: selectedMenu == index ? Colors.white : TColor.text,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Icon(
                              mObj["icon"] as IconData? ?? Icons.home,
                              color: selectedMenu == index ? Colors.white : TColor.primary,
                              size: 33,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: TColor.blackColor.withOpacity(.5),
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Terms',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w600, color: TColor.blackColor.withOpacity(.5)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Privacy',
                          style: GoogleFonts.poppins(
                              fontSize: 15, fontWeight: FontWeight.w600, color: TColor.blackColor.withOpacity(.5)),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        const HomeScreen(),
        const SearchScreen(),
        Container(),
        Container(),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: TColor.primary,
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelColor: TColor.whiteColor,
          unselectedLabelColor: TColor.whiteColor.withAlpha(150),
          controller: tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: "Home"),
            Tab(icon: Icon(Icons.search), text: "Search"),
            Tab(icon: Icon(Icons.list), text: "Wishlist"),
            Tab(icon: Icon(Icons.shopping_cart), text: "Cart"),
          ],
        ),
      ),
    );
  }
}
