import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final Function() onClick;
  final TextStyle textStyle;
  final Color backgroundColor;
  final double width;
  final double height;
  final String text;

  // Constructor
  const LongButton(
    this.text, {
      super.key,
      this.textStyle = const TextStyle(color: Colors.black),
      required this.onClick,
      required this.width,
      required this.height,
      this.backgroundColor = Colors.white,
  });

  // Main function
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      // Actual Button
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: onClick,
        // The text inside of the button
        child: Text(text, style: textStyle),
      ),
    );
  }
}
