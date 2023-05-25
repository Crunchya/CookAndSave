import 'package:cooksave/pages/main_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:cooksave/assets/images/images.dart';

class MyApp extends StatelessWidget {

  // Constructor
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Main App
    return MaterialApp(
      // This is for disabling the "debug" banner in the top right
      debugShowCheckedModeBanner: false,
      // Title
      title: 'Cook&Save',
      // Base theme of the app
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF023E3A)),
      ),
      // Directionnality is for longtexts bugs
      home: Directionality(
        // Direction of text set to Left-To-Right
        textDirection: TextDirection.ltr,
        // The splash screen at the beginning
        child: EasySplashScreen(
          logo: Image.asset(CustomImages.splashGif),
          backgroundColor: const Color(0xFF023E3A),
          // The view to go to
          navigator: const MainView(),
          durationInSeconds: 5,
          showLoader: false,
        ),
      ),
    );
  }
}
