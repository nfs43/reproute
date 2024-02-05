// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rep_route/helper/SharedPref.dart';
import 'package:rep_route/routes/Routes.dart';
import 'package:rep_route/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    Timer(const Duration(seconds: 3), () async {

      
    SharedPref.init().then((value) {
      if (value.isUserExist()) {
        Navigator.pushReplacementNamed(context, RoutesName.rootScreen);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
      }
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryGrey,
        body: SafeArea(
            child: Center(
                child: Image.asset(
          'assets/logo/full_logo.png',
          height: 120,
          fit: BoxFit.contain,
        ))));
  }
}
