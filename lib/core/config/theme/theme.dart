import 'package:flutter/material.dart';

import 'app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.neutralBlackProcess,
  primaryColor: AppColors.primary,
  // primaryColor: Colors.purpleAccent,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: AppColors.primaryWhite),
    bodyMedium: TextStyle(color: AppColors.neutralGrayMiddle),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    suffixIconColor: AppColors.neutralGrayMiddle,
    hintStyle: TextStyle(color: AppColors.neutralGrayMiddle50),
    fillColor: Colors.white10,
    labelStyle: TextStyle(color: AppColors.neutralGrayMiddle),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF6C6D7A), width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0XFFBC4CF1).withAlpha(51),
      textStyle: TextStyle(
        color: Color(0xFFAA73F0),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          width: 1,
          color: Color(0xFFAA73F0),
        ),
      ),
    ),
  ),
);
