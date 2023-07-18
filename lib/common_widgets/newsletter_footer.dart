import 'package:book_store_app/common_widgets/material_button.dart';
import 'package:book_store_app/common_widgets/text_field.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:book_store_app/view/login/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsletterForm extends StatefulWidget {
  const NewsletterForm({super.key});

  @override
  State<NewsletterForm> createState() => _NewsletterFormState();
}

class _NewsletterFormState extends State<NewsletterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateButtonState);
    nameController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      _isEnabled = emailController.text.isNotEmpty && nameController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(color: TColor.textbox.withOpacity(0.4), borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(
            'Receive our monthly newsletter and receive updates on new stock, books and the occasional promotion',
            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w700, color: TColor.subTitle),
          ),
          MyTextField(controller: nameController, hintText: 'Your Name', isObscured: false),
          MyTextField(controller: emailController, hintText: 'Your Email', isObscured: false),
          MyMaterialButton(
            buttonText: 'Sign Up',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ));
            },
            isEnabled: _isEnabled,
          )
        ],
      ),
    );
  }
}
