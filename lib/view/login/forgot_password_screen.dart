// ignore_for_file: prefer_const_constructors

import 'package:book_store_app/common_widgets/material_button.dart';
import 'package:book_store_app/common_widgets/text_field.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      _isEnabled = emailController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.whiteColor,
      appBar: AppBar(
        backgroundColor: TColor.whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: TColor.primary,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot password',
                style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700, color: TColor.blackColor),
              ),
              const SizedBox(height: 15),
              Text(
                'Enter the email associated with your account and we will send you instructions how to reset your password.',
                style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.normal, color: TColor.primary),
              ),
              const SizedBox(height: 15),
              MyTextField(controller: emailController, hintText: 'Email Address', isObscured: false),
              const SizedBox(height: 15),
              MyMaterialButton(
                buttonText: 'Submit',
                onPressed: () {},
                isEnabled: _isEnabled,
              )
            ],
          ),
        ),
      ),
    );
  }
}
