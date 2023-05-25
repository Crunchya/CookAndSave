import 'package:cooksave/Widgets/button.dart';
import 'package:cooksave/Widgets/long_button.dart';
import 'package:cooksave/assets/colors/colors.dart';
import 'package:cooksave/assets/icons/icons.dart';
import 'package:cooksave/helpers/functions.dart';
import 'package:cooksave/ui/typography.dart';
import 'package:flutter/material.dart';
import 'package:cooksave/models/ingredient_card.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'package:cooksave/pages/searchview.dart';

class SwipeView extends StatefulWidget {

  // Constructor
  const SwipeView({
    super.key,
  });

  // Creating the state of the view
  @override
  State<SwipeView> createState() => _SwipeViewState();
}

class _SwipeViewState extends State<SwipeView>
    with SingleTickerProviderStateMixin {
  final CardSwiperController controller = CardSwiperController();
  late List<dynamic> dataList = [];
  late List<int> selectedList = [];
  late List<int> specialList = [];
  late List<int> disabledList = [];
  late bool special = false;

  // Initializing the state
  @override
  void initState() {
    super.initState();
    getAll();
  }

  // Getting all the data
  void getAll() async {

    // Getting the ingredients
    final ingredients = await FunctionHelper.getHttp("/ingredients");

    setState(
      () {
        // Setting the ingredients
        dataList = ingredients;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Scaffold(
          backgroundColor: CustomColors.darkGreen,
          // Any ingredients in the list?
          body: dataList.isNotEmpty
              ? // If there's some
               SafeArea(
                  child: Column(
                    children: [
                      Flexible(
                        // Ingredients swiper
                          child: CardSwiper(
                        controller: controller,
                        cards: dataList
                            .map((datas) => IngredientCard(data: datas))
                            .toList(),
                        onSwipe: _swipe,
                        scale: 0,
                        onEnd: () {
                          // We go to the next page when all the ingredients are swiped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchView(
                                      selectedList: selectedList,
                                      specialList: specialList,
                                      disabledList: disabledList,
                                    )),
                          );
                        },
                        padding: const EdgeInsets.only(
                            top: 24.0, left: 24, right: 24),
                      )),
                      // Buttons for swiping
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          children: [
                            const Spacer(),
                            // Cross button
                            CustomButton(
                              onClick: controller.swipeLeft,
                              isIcon: true,
                              heroTag: "left",
                              color: CustomColors.lightRed,
                              icon: Icons.close_rounded,
                              width: 75,
                              height: 75,
                              iconSize: 60,
                            ),
                            const SizedBox(width: 30),
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              // Heart button
                              child: CustomButton(
                                onClick: () => {
                                  setState(() {
                                    // The checked value is set to true because the recipe is special
                                    special = true;
                                  }),
                                  controller.swipeRight()
                                },
                                isIcon: true,
                                heroTag: "special",
                                color: CustomColors.purple,
                                icon: Icons.favorite,
                                width: 40,
                                height: 40,
                                iconSize: 30,
                              ),
                            ),
                            const SizedBox(width: 30),
                            // Fridge button
                            CustomButton(
                              onClick: controller.swipeRight,
                              isIcon: true,
                              heroTag: "right",
                              color: CustomColors.green,
                              icon: CustomIcons.fridge,
                              width: 75,
                              height: 75,
                              iconSize: 50,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17, bottom: 40),
                        // "I'm done" button
                        child: LongButton(
                          "J'EN AI ASSEZ !",
                          onClick: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchView(
                                        selectedList: selectedList,
                                        specialList: specialList,
                                        disabledList: disabledList,
                                      )),
                            )
                          },
                          textStyle: CustomTextStyles.subtitle(
                              color: CustomColors.darkGreen),
                          width: 200,
                          height: 35,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              : // else we indicate it's loading
              const Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }

  // Called when a card is swiped
  void _swipe(int index, CardSwiperDirection direction) {
    if (direction == CardSwiperDirection.right) {
      if (special) {
        specialList.add(dataList.toList()[index]["id"]);
        setState(() {
          // reinitialization of the check value
          special = false;
        });
      } else {
        setState(() {
          // we add the selected item to the selected list
          selectedList.add(dataList.toList()[index]["id"]);
        });
      }
    } else if (direction == CardSwiperDirection.left) {
      setState(() {
        // we add the selected item to the disabled list
        disabledList.add(dataList.toList()[index]["id"]);
      });
    }
  }
}
