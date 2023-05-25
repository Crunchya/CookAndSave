import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooksave/Widgets/populaire_indicator.dart';
import 'package:cooksave/assets/colors/colors.dart';
import 'package:cooksave/ui/typography.dart';
import 'package:flutter/material.dart';
import 'package:cooksave/helpers/functions.dart';

class PopulaireRecipeCard extends StatelessWidget {
  // Data retrieved from the DB
  final Map data;
  final double height;

  // Constructor
  const PopulaireRecipeCard({
    super.key,
    required this.data,
    required this.height,
  });

  // Main function
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 332,
      height: height + 50,
      child: Column(
        children: [
          SizedBox(
            width: 332,
            height: height,
            // Background image
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(data["image_link"]),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Populaire indicator with the flame emoji
                        PopulaireIndicator(
                          "Populaire 🔥",
                          height: 26,
                          width: 120,
                          textStyle: CustomTextStyles.body(
                              color: Colors.white, bold: true),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, bottom: 20.0, right: 20.0),
                    // Bottom row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Likes
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              data["likes"].toString(),
                              style: CustomTextStyles.body(color: Colors.white),
                            )
                          ],
                        ),
                        // Preparation time
                        Row(
                          children: [
                            const Icon(
                              Icons.schedule,
                              color: Colors.white,
                              size: 15,
                            ),
                            Text(
                              "${FunctionHelper.formatNumber(data["preparation_time"] / 60 * 1)} min",
                              style: CustomTextStyles.body(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Title of the recipe
          Text(
            data["title"],
            textAlign: TextAlign.center,
            style: CustomTextStyles.subtitle(
              color: CustomColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
