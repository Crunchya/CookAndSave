import 'package:flutter/material.dart';
import 'package:cooksave/assets/colors/colors.dart';


class CustomTextStyles {
  // Style for the titles of the app
  static TextStyle title (
    { Color color = CustomColors.purple, String family = "GlacialIndifference"}){
      return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: family,
        fontSize: 32,
        decoration: TextDecoration.none,
      );
    }

  // Style for the main text of the app
  static TextStyle body (
    { Color color = CustomColors.purple, String family = "GlacialIndifference", bold = false}){
      return TextStyle(
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontFamily: family,
        fontSize: 12,
        decoration: TextDecoration.none,
      );
    }

  // Style for the subtitles of the app
  static TextStyle subtitle (
    { Color color = CustomColors.purple, String family = "GlacialIndifference"}){
      return TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontFamily: family,
        fontSize: 20,
        decoration: TextDecoration.none,
      );
    }
  }