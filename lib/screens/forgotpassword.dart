// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rep_route/routes/Routes.dart';
import 'package:rep_route/theme.dart';
import 'package:rep_route/utils/utils.dart';
import 'package:rep_route/widgets/InputFIeld.dart';
import 'package:rep_route/widgets/PrimaryButton.dart';
import 'package:rep_route/widgets/buttonIcon.dart';
import 'package:rep_route/widgets/horizontalineOr.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  int _current = 0;

  final TextEditingController emailController = TextEditingController(text: '');

  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    double isTablet = MediaQuery.of(context).size.width;
    bool isTabletlhorizontal =
        isTablet >= 600 && orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: primaryGrey,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 10,
              ),
              width: double.infinity,
              child: Image.asset('assets/logo/full_logo.png', height: 130)),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75),
                )
              ],
            ),
            child: Container(
              height: isTabletlhorizontal ? 500 : null,
              width: isTabletlhorizontal ? 600 : null,
              padding: EdgeInsets.only(
                left: isTabletlhorizontal ?60:30,
                right: isTabletlhorizontal ?60:30,
                top: 30,
                bottom: 30
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Text('Forgot Password?',
                        //child: Text(isTabletlhorizontal.toString(),

                        overflow: TextOverflow.ellipsis,
                        style: mainHeading.copyWith(
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    child: Text(
                      "Enter your email and we'll send you instructions to reset your password",
                      style: smallText.copyWith(color: Colors.black),
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 10, top: 20),
                            child: Text('Email Address',
                                style: labelInput.copyWith(color: textBlack))),
                        InputField(
                          hintText: 'Enter email to get started',
                          // suffixIcon: const SizedBox(),
                          controller: emailController,
                          validator: validateEmail,
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: HorizontalOrLine(
                      label: 'Or',
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 30),
                    child: CustomPrimaryButton(
                      buttonColor: buttonbg,
                      textValue: 'Send Reset Link',
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RoutesName.resetPasswordScreen);
                      },
                    ),
                  ),
                  HorizontalOrLine(label: 'Or', height: 1, thickness: 1),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back to login',
                        style: smallblueBoldtext.copyWith(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }
}
