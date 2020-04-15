import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  var _themeMode = ThemeMode.light;

  get getTheme => _themeMode;

  toggle() {
    var _newTheme = (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    setTheme(_newTheme);
  }

  setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
