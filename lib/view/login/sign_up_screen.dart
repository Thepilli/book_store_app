// ignore_for_file: prefer_const_constructors

import 'package:book_store_app/common_widgets/material_button.dart';
import 'package:book_store_app/common_widgets/text_field.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isEnabled = false;
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(updateButtonState);
    emailController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
    codeController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      _isEnabled = nameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          phoneNumberController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
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
                'Sign Up',
                style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700, color: TColor.blackColor),
              ),
              MyTextField(controller: nameController, hintText: 'First & Last Name', isObscured: false),
              MyTextField(controller: emailController, hintText: 'Email', isObscured: false),
              MyTextField(controller: phoneNumberController, hintText: 'Mobile Phone', isObscured: false),
              MyTextField(controller: codeController, hintText: 'Group Special Code (Optional)', isObscured: false),
              MyTextField(controller: passwordController, hintText: 'Password', isObscured: true),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    checkColor: TColor.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: BorderSide(
                      color: TColor.blackColor,
                      width: 1.0,
                    ),
                  ),
                  Text(
                    'Please sign me up for a newsletter',
                    style: TextStyle(
                      color: TColor.blackColor,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              MyMaterialButton(buttonText: 'Sign Up', onPressed: () {}, isEnabled: _isEnabled)
            ],
          ),
        ),
      ),
    );
  }
}
