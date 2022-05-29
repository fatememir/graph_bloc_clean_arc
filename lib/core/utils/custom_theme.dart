import 'package:flutter/material.dart';

import 'my_colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: MyColors.blue,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'IranYekan',
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 28,
          color: MyColors.blackPearl,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: MyColors.blackPearl,
        ),
        headline3: TextStyle(
          fontWeight: FontWeight.w400,
          color: MyColors.blackPearl,
          fontSize: 16,
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.w400,
          color: MyColors.ebonyClay,
          fontSize: 16,
        ),
        bodyText2: TextStyle(
          fontFamily: "IranYekan",
          fontWeight: FontWeight.w400,
          color: MyColors.regentGray,
          fontSize: 15,
        ),
      ),
      iconTheme: const IconThemeData(color: MyColors.blackPearl),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        buttonColor: MyColors.blue,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: MyColors.blue,
      scaffoldBackgroundColor: MyColors.blackPearl,
      fontFamily: 'IranYekan',
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 28,
          color: MyColors.white,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: MyColors.white,
        ),
        headline3: TextStyle(
          fontWeight: FontWeight.w400,
          color: MyColors.white,
          fontSize: 16,
        ),
        bodyText1: TextStyle(
          fontWeight: FontWeight.w400,
          color: MyColors.white_60,
          fontSize: 16,
        ),
        bodyText2: TextStyle(
          fontFamily: "IranYekan",
          fontWeight: FontWeight.w400,
          color: MyColors.regentGray,
          fontSize: 15,
        ),
      ),
      iconTheme: const IconThemeData(color: MyColors.white),
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        buttonColor: MyColors.blue,
      ),
    );
  }
}
