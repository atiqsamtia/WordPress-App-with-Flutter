import 'package:flutter/material.dart';

class Style {
  static ThemeData get(bool isDark) {
    Color backgroundColor = isDark ? Colors.black : Colors.white;
    Color foregroundColor = isDark ? Colors.white : Colors.black;
    return ThemeData(
      // brightness: isDark ? Brightness.dark : Brightness.light,
      backgroundColor: backgroundColor,
      canvasColor: backgroundColor,
      primaryColor: Color(0xFF249991),
      appBarTheme: AppBarTheme(
          color: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: foregroundColor), toolbarTextStyle: TextTheme(
            titleMedium: TextStyle(
              color: foregroundColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ).bodyText2, titleTextStyle: TextTheme(
            titleMedium: TextStyle(
              color: foregroundColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ).headline6),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: foregroundColor, fontWeight: FontWeight.bold),
        bodyText2: TextStyle(
          color: foregroundColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          fontFamily: 'Roboto',
        ),
      ),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Color(0xFF249991), brightness: isDark ? Brightness.dark : Brightness.light),
      textSelectionTheme: TextSelectionThemeData(selectionColor: isDark ? Colors.white12 : Colors.grey.shade300),
    );
  }
}
