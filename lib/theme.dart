import 'package:flutter/material.dart';

class Style {
  static ThemeData get(bool isDark) {
    Color backgroundColor = isDark ? Colors.black : Colors.white;
    Color foregroundColor = isDark ? Colors.white : Colors.black;
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      backgroundColor: backgroundColor,
      textSelectionColor: isDark ? Colors.white12 : Colors.grey.shade300,
      primaryColor: Color(0xFF249991),
      accentColor: Color(0xFF249991),
      appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            title: TextStyle(
              color: foregroundColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: backgroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: foregroundColor)),
      textTheme: TextTheme(
        display1: TextStyle(color: foregroundColor, fontWeight: FontWeight.bold),
        body2: TextStyle(
          color: foregroundColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
