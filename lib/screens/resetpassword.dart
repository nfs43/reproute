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

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordScreen> {
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
              borderRadius: BorderRadius.circular(10),
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
                  left: isTabletlhorizontal ? 60 : 30,
                  right: isTabletlhorizontal ? 60 : 30,
                  top: 30,
                  bottom: 30),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Text('Reset Password',
                        overflow: TextOverflow.ellipsis,
                        style: mainHeading.copyWith(
                          color: Colors.black,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    child: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                              text: 'for',
                              style: normalText.copyWith(color: Colors.black)),
                          const WidgetSpan(
                            child: SizedBox(
                                width:
                                    8), // Adjust the width according to your preference
                          ),
                          TextSpan(
                              text: 'john.doe@email.com',
                              style: normalText.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Form(
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 10, top: 20),
                            child: Text('New Password',
                                style: labelInput.copyWith(color: textBlack))),
                        InputField(
                          hintText: 'Enter your password',
                          // suffixIcon: const SizedBox(),
                          controller: emailController,
                          validator: validateEmail,
                          textInputAction: TextInputAction.next,
                        ),
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 10, top: 20),
                            child: Text('Confirm New Password',
                                style: labelInput.copyWith(color: textBlack))),
                        InputField(
                          hintText: 'Enter your password',
                          // suffixIcon: const SizedBox(),
                          controller: emailController,
                          validator: validateEmail,
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: CustomPrimaryButton(
                      buttonColor: buttonbg,
                      textValue: 'Set new password',
                      textColor: Colors.white,
                      onPressed: () {},
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
