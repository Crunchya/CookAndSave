import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cooksave/controllers/custom_dropdown_controller.dart';
import 'dart:developer' as developper;

class FunctionHelper {

  // Function to format a floating number into an integer as a string
  static String formatNumber(double? number) {
    if (number == null) return '0';

    return (number * 10) % 10 != 0 ? '$number' : '${number.toInt()}';
  }

  // Function to hide the dropdown menus
  static void hideMenu(CustomDropdownController controller) {
    controller.showMenu = false;
  }

  // Function to format a string into a base64 string
  static Codec<String, String> stringToBase64 = utf8.fuse(base64);

  // Function to get response datas from a url
  static dynamic getHttp(String url) async {
    // Initialization of the dio client
    Dio dio = Dio(BaseOptions(baseUrl: "http://cookandsave.net/api", headers: {
      "Content-Type": "application/json",
      "Authorization":
          "Basic ${stringToBase64.encode('${dotenv.env["DB_USER"]}:${dotenv.env["DB_PASSWORD"]}')}",
    }));
    try {
      // Request to the url
      Response response = await dio.get(url);
      // return the response
      return response.data;
    } catch (e) {
      // Else we log the error
      developper.log(e.toString());
    }
  }
}
