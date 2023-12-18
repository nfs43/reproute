// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rep_route/theme.dart';

class ButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String imagePath;
  final String btntext;

  const ButtonIcon({Key? key,required this.btntext, required this.imagePath, required this.onPressed})
      : super(key: key);
//'assets/icons/google.png'
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
  onPressed: () {},
  icon: Image.asset(
    imagePath,
  ),
  label: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        btntext,
        style: buttonIcontext.copyWith(),
      ), // Replace with your desired icon
    ],
  ),
  style: ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
        color: Colors.grey.shade300,
        width: 1.0,
      ),
    ),
    minimumSize: Size(double.infinity, 60),
  ),
);
 }
}
