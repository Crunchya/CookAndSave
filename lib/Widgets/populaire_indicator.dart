import 'package:cooksave/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class PopulaireIndicator extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final TextStyle? textStyle;
  final Color backgroundColor;

  // Constructor
  const PopulaireIndicator(
    this.text, {
    super.key,
    required this.height,
    required this.width,
    this.textStyle,
    this.backgroundColor = CustomColors.darkGreen,
  });

  // Main function
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      // The decoration for the background and the shape
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30)
      ),
      // The text inside
      child: Center(child: Text(text, style: textStyle)),
    );
  }
}
