import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Color(0XFFBC4CF1),
  // primaryColor: Colors.purpleAccent,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    suffixIconColor: Colors.white54,
    hintStyle: TextStyle(color: Colors.white54),
    fillColor: Colors.white10,
    labelStyle: TextStyle(color: Colors.white70),
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
