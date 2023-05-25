import 'package:cooksave/Widgets/custom_dropdown_menu.dart';
import 'package:cooksave/controllers/custom_dropdown_controller.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final TextStyle textStyle;
  final Color backgroundColor;
  final double width;
  final double height;
  final String text;
  final CustomDropdownMenu child;
  final CustomDropdownController controller;

  // Constructor
  const CustomDropdownButton(
    this.text, {
    super.key,
    this.textStyle = const TextStyle(color: Colors.black),
    this.width = 100,
    required this.height,
    required this.controller,
    this.backgroundColor = Colors.white,
    required this.child,
  });

  // Creating the state of the widget
  @override
  State<CustomDropdownButton> createState() => CustomDropdownButtonState();
}

class CustomDropdownButtonState extends State<CustomDropdownButton> {
  bool showMenu = false;

  // Initializing the state of the widget
  @override
  void initState() {
    super.initState();
  }

  // Main function
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.backgroundColor,
              surfaceTintColor: widget.backgroundColor,
              shadowColor: widget.backgroundColor,
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
            onPressed: () => {
              setState(
                () {
                  // We show the menu when the button is pressed
                  widget.controller.showMenu = true;
                },
              )
            },
            // The visuals inside of the button
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_drop_down, color: widget.textStyle.color),
                  const Spacer(),
                  Text(widget.text, style: widget.textStyle),
                ],
              ),
            ),
          ),
        ),
        // The menu of the dropdown
        widget.controller.showMenu
            ? 
            // If the boolean is true, we show the menu
            Container(
                width: widget.width,
                color: Colors.white,
                child: widget.child,
              )
            :
            // Else we hide the menu
            SizedBox(
                width: widget.width,
                height: 0,
              )
      ],
    );
  }
}
