import 'package:flutter/material.dart';
import 'package:onlab1/config/color_constants.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.0, 0.4],
              colors: [ColorConstants.primaryLight, ColorConstants.primary])),
    );
  }
}
