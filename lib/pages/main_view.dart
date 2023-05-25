import 'package:cooksave/assets/colors/colors.dart';
import 'package:cooksave/assets/images/images.dart';
import 'package:cooksave/pages/settingview.dart';
import 'package:cooksave/pages/swipingview.dart';
import 'package:cooksave/pages/userview.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  // Constructor
  const MainView({super.key});

  // Main function
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        // App bar at the top
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: CustomColors.darkGreen,
            bottom: TabBar(
                indicatorColor: CustomColors.darkGreen,
                dividerColor: CustomColors.darkGreen,
                overlayColor: MaterialStateProperty.all(CustomColors.darkGreen),
                automaticIndicatorColorAdjustment: false,
                tabs: [
                  // Settings
                  const Tab(
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  // Logo image
                  Tab(
                    child: Image.asset(CustomImages.splash),
                  ),
                  // User infos
                  const Tab(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ]),
          ),
        ),
        // The page underneath the bar
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            SettingsView(),
            SwipeView(),
            UserView(),
          ],
        ),
      ),
    );
  }
}
