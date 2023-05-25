import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cooksave/cookandsave.dart';

void main() async {
  // To make sure the binding is initialized properly
  WidgetsFlutterBinding.ensureInitialized();
  // Loading the .env
  await dotenv.load(fileName: '.env');
  // Running the app
  runApp(const MyApp());
}
