import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooksave/assets/colors/colors.dart';
import 'package:cooksave/helpers/functions.dart';
import 'package:cooksave/ui/typography.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  // Datas retrived from the DB
  final Map data;
  final double width;

  // Constructor
  const RecipeCard({
    super.key,
    required this.data,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: width,
            // Background image
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                image: DecorationImage(
                    image: CachedNetworkImageProvider(data["image_link"]),
                    fit: BoxFit.fitHeight),
              ),
              // Bottom left alignment
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 12.0, right: 20.0),
                // Bottom row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Likes
                    Row(
                      children: [
                        const Icon(Icons.favorite_border, color: Colors.white, size: 15,),
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
