import 'package:flutter/material.dart';
import 'package:rep_route/widgets/ProgressIndicator/SpinKitCircle.dart';


class LoadingWidget extends StatelessWidget {
  final Color color;
  final double size;

  const LoadingWidget({
    Key? key,
    this.color = Colors.black,
    this.size = 80.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitCircle(
        color: color,
        size: size,
      ),
    );
  }
}