import 'package:cooksave/Widgets/custom_dropdown_button.dart';
import 'package:cooksave/Widgets/custom_dropdown_menu.dart';
import 'package:cooksave/Widgets/custom_dropdown_menu_item.dart';
import 'package:cooksave/assets/colors/colors.dart';
import 'package:cooksave/controllers/custom_dropdown_controller.dart';
import 'package:cooksave/helpers/functions.dart';
import 'package:cooksave/models/populaire_recipe_card.dart';
import 'package:cooksave/models/recipe_card.dart';
import 'package:cooksave/pages/main_view.dart';
import 'package:cooksave/ui/typography.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  final List<int> selectedList;
  final List<int> specialList;
  final List<int> disabledList;

  // Constructor
  const SearchView({
    super.key,
    required this.selectedList,
    required this.specialList,
    required this.disabledList,
  });

  // Creating the state of the view
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late List<dynamic> dataList = [];
  late List<dynamic> populaireList = [];
  CustomDropdownController recipeController = CustomDropdownController();
  CustomDropdownController timeController = CustomDropdownController();
  CustomDropdownController regimeController = CustomDropdownController();

  // Initializing the state
  @override
  void initState() {
    super.initState();
    getAll();
  }

  // Getting all the data
  void getAll() async {

    // Getting the popular recipe
    final populaire = await FunctionHelper.getHttp("/recipes/populaire.php");

    // Getting all of the other the recipes
    final recipes = await FunctionHelper.getHttp(
        "/recipes?ingredients=${widget.selectedList}&populaire_id=${populaire.first["id"]}");

    setState(
      () {

        // Setting the popular recipe
        populaireList = populaire;

        // Setting all of the other recipes
        dataList = recipes;

      },
    );
  }

  // Main function
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // App bar
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Recherche",
          style: CustomTextStyles.title(color: CustomColors.black),
        ),
        leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              surfaceTintColor:Colors.white,
            ),
            onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainView()))
                },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 30,
            )),
        actions: const [],
      ),
      // Scrollview
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
                // Dropdown buttons
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // "Repas" dropdown
                    CustomDropdownButton(
                      "Repas",
                      controller: recipeController,
                      backgroundColor: CustomColors.lighterOrange,
                      textStyle: CustomTextStyles.body(color: Colors.white),
                      height: 27,
                      child: CustomDropdownMenu(items: [
                        CustomDropdownMenuItem(
                          text: "Snack",
                          onPressed: () => setState(
                            () => FunctionHelper.hideMenu(recipeController),
                          ),
                          textStyle: CustomTextStyles.body(
                              color: CustomColors.darkGreen),
                        ),
                      ]),
                    ),
                    // "Temps" dropdown
                    CustomDropdownButton(
                      "Temps",
                      controller: timeController,
                      backgroundColor: CustomColors.lighterOrange,
                      textStyle: CustomTextStyles.body(color: Colors.white),
                      height: 27,
                      child: CustomDropdownMenu(items: [
                        CustomDropdownMenuItem(
                          text: "10 min",
                          onPressed: () => setState(
                            () => FunctionHelper.hideMenu(timeController),
                          ),
                          textStyle: CustomTextStyles.body(
                              color: CustomColors.darkGreen),
                        ),
                        CustomDropdownMenuItem(
                          text: "20 min",
                          onPressed: () => setState(
                            () => FunctionHelper.hideMenu(timeController),
                          ),
                          textStyle: CustomTextStyles.body(
                              color: CustomColors.darkGreen),
                        ),
                      ]),
                    ),
                    // "Regime" dropdown
                    CustomDropdownButton(
                      "Régime",
                      controller: regimeController,
                      backgroundColor: CustomColors.lighterOrange,
                      textStyle: CustomTextStyles.body(color: Colors.white),
                      height: 27,
                      child: CustomDropdownMenu(items: [
                        CustomDropdownMenuItem(
                          text: "Veggie",
                          onPressed: () => setState(
                            () => FunctionHelper.hideMenu(regimeController),
                          ),
                          textStyle: CustomTextStyles.body(
                              color: CustomColors.darkGreen),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
              // Popular recipe
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: populaireList
                    .map((element) =>
                        PopulaireRecipeCard(data: element, height: 200))
                    .toList(),
              ),
              // All the recipes selected except the popular one
              Wrap(
                spacing: 20,
                children: dataList
                    .map(
                      (datas) => RecipeCard(
                        data: datas,
                        width: 146,
                      ),
                    )
                    .toList(),
              ),
            ]),
      ),
    );
  }
}
