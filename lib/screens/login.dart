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

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  var imglist = [
    'assets/images/mac.png',
    'assets/images/mac.png',
    'assets/images/mac.png',
    'assets/images/mac.png',
  ];
  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController companynameController =
      TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  bool _isloading = false;
  bool _isChecked = false;
  bool passwordVisible = false;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryGrey,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(
                top: 30,
                bottom: 60,
              ),
              width: double.infinity,
              child: Image.asset('assets/logo/full_logo.png', height: 130)),

          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 200.0,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              scrollDirection: Axis.horizontal,
            ),
            items: imglist.map((String assetPath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(
                      assetPath,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Feature Placeholder',
                    overflow: TextOverflow.ellipsis,
                    style: mainHeading.copyWith(color: Colors.black)),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                      'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed qu',
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: normalText.copyWith(color: Colors.black)),
                ),
              ],
            ),
          ),
          // Add your carousel indicator here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imglist.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                  offset: Offset(0.0, 0.0),
                )
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    width: double.infinity,
                    child: Text('Login to Reproute',
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
                        text: 'Dont have an account? ',
                        style: normalText.copyWith(color: Colors.black),
                        children: <InlineSpan>[
                          WidgetSpan(
                            child: SizedBox(
                              width: 10,
                            ),
                          ),
                          TextSpan(
                            text: 'Create a free account',
                            style: smallblueBoldtext.copyWith(),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                    context, RoutesName.signUpScreen);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  ButtonIcon(
                    imagePath: 'assets/icons/google.png',
                    btntext: 'Login with Google',
                    onPressed: () {},
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: ButtonIcon(
                      imagePath: 'assets/icons/facebook.png',
                      btntext: 'Login with Facebook',
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: HorizontalOrLine(
                      label: 'Or',
                      height: 1,
                      thickness: 1,
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
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 10, top: 20),
                            child: Text('Password',
                                style: labelInput.copyWith(color: textBlack))),
                        InputField(
                          hintText: 'Enter your password',
                          controller: passwordController,
                          obscureText: !passwordVisible,
                          validator: validateInputString,
                          // suffixIcon: IconButton(
                          //   color: Colors.black,
                          //   splashRadius: 1,
                          //   icon: Icon(passwordVisible
                          //       ? Icons.visibility_outlined
                          //       : Icons.visibility_off_outlined),
                          //   onPressed: togglePassword,
                          // ),
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Theme(
                            data: ThemeData(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity(
                                  horizontal: -4.0, vertical: -4.0),
                            ),
                            child: Checkbox(
                              value: _isChecked,
                              onChanged: (newValue) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                setState(() {
                                  _isChecked = newValue!;
                                  print(newValue);
                                });
                              },
                              side: BorderSide(
                                  color: Colors.grey.shade400,
                                  style: BorderStyle.solid,
                                  width: 2),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Remember me',
                            style: smallboldtext.copyWith(color: Colors.black),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.forgotPasswordScreen);
                          },
                          child: Text(
                            'Forgot Password?',
                            style: smallblueBoldtext.copyWith(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: CustomPrimaryButton(
                      buttonColor: buttonbg,
                      textValue: 'Login',
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
