import 'package:flutter/material.dart';

class SunnahDietTheme {
  SunnahDietTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: const Color(0xFF034620),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF034620),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'Poppins',
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      dividerColor: Colors.transparent);

//dark not implemented yet
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF034620),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF034620),
    ),
    scaffoldBackgroundColor: Colors.black,
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
