import 'package:cooksave/Widgets/custom_dropdown_menu_item.dart';
import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List<CustomDropdownMenuItem> items;
  final Color backgroundColor;

  // Constructor
  const CustomDropdownMenu({
    super.key,
    required this.items,
    this.backgroundColor = Colors.white,
  });

  // Main function
  @override
  Widget build(BuildContext context) {
    return Container(
      // The decoration of the menu
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // Full parent width
      width: double.maxFinite,
      // The menu items
      child: Column(children: items));
  }
}
