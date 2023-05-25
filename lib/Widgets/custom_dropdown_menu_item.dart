import 'package:flutter/material.dart';

class CustomDropdownMenuItem extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Function() onPressed;

  // Constructor
  const CustomDropdownMenuItem({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textStyle = const TextStyle(color: Colors.black),
  });

  // Main function
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 30,
      // The item
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          surfaceTintColor: backgroundColor,
          shape: const ContinuousRectangleBorder(),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(text, style: textStyle),
        ),
      ),
    );
  }
}
