import 'package:flutter/material.dart';

import './config.dart';
import './pages/home.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      themeMode: ThemeMode.light,
      darkTheme: Style.get(true),
      theme: Style.get(false),
      home: HomePage(),
    );
  }
}
