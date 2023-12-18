import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HorizontalOrLine extends StatelessWidget {
  const HorizontalOrLine({
    required this.label,
    required this.height,
    required this.thickness,
  });

  final String label;
  final double height;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: Divider(
              color: Colors.grey.shade300,
              height: height,
              thickness: thickness,
            )),
      ),
      Text(label),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Divider(
              color: Colors.grey.shade300,
              height: height,
              thickness: thickness,
            )),
      ),
    ]);
  }
}
