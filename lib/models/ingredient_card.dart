import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooksave/ui/typography.dart';
import 'package:flutter/material.dart';

import '../assets/colors/colors.dart';

class IngredientCard extends StatelessWidget {
  // Datas retrieved from the DB
  final Map data;

  // Constructor
  const IngredientCard({
    super.key,
    required this.data,
  });

  // Main function
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // 60% of the device's height
      height: MediaQuery.of(context).size.height * 0.6,
      // 90% of the device's width
      width: MediaQuery.of(context).size.width * 0.9,
      // Stacking
      child: Stack(children: [
        // White border around the picture
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: CustomColors.darkGreen,
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
        ),
        // Ingredient picture
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                  image: CachedNetworkImageProvider(Uri.encodeFull(
                      jsonDecode(data["image_url"])[0].toString())),
                  fit: BoxFit.fitHeight),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            // Bottom left alignment
            alignment: Alignment.bottomLeft,
            // Column containing the text
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text (ingredient's name)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["name"].toString(),
                        style: CustomTextStyles.title(
                            color: CustomColors.darkGreen),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
