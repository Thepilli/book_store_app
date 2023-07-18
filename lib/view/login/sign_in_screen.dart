// ignore_for_file: prefer_const_constructors

import 'package:book_store_app/common_widgets/material_button.dart';
import 'package:book_store_app/common_widgets/text_field.dart';
import 'package:book_store_app/constants/color_extenstion.dart';
import 'package:book_store_app/view/login/forgot_password_screen.dart';
import 'package:book_store_app/view/login/help_us_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  bool _isEnabled = false;
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
    codeController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      _isEnabled = emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
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
                'Sign In',
                style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w700, color: TColor.blackColor),
              ),
              MyTextField(controller: codeController, hintText: 'Optional Group Special Code', isObscured: false),
              MyTextField(controller: emailController, hintText: 'Email Address', isObscured: false),
              MyTextField(controller: passwordController, hintText: 'Password', isObscured: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                        'Stay logged in',
                        style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600, color: TColor.blackColor),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600, color: TColor.blackColor),
                    ),
                  ),
                ],
              ),
              MyMaterialButton(
                buttonText: 'Sign In',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpUsScreen(),
                      ));
                },
                isEnabled: _isEnabled,
              )
            ],
          ),
        ),
      ),
    );
  }
}
