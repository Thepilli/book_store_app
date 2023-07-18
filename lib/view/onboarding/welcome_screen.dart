import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:book_store_app/common_widgets/material_button.dart';
import 'package:book_store_app/view/login/sign_in_screen.dart';
import 'package:book_store_app/view/login/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome_bg.png',
            height: size.height,
            width: size.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  SizedBox(height: size.width * 0.25),
                  Text(
                    'Books For\nEvery Taste',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700, color: TColor.primary),
                  ),
                  SizedBox(height: size.width * 0.25),
                  MyMaterialButton(
                    buttonText: 'Sign In',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ));
                    },
                    isEnabled: true,
                  ),
                  const SizedBox(height: 15),
                  MyMaterialButton(
                    buttonText: 'Sign Up',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                    isEnabled: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
