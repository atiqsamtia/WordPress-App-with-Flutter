import 'package:flutter/material.dart';

import './config.dart';
import './pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      theme: ThemeData(
        primaryColor: Color(0xFF249991),
        accentColor: Color(0xFF249991),
        appBarTheme: AppBarTheme(
            textTheme: TextTheme(title: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold)),
            color: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
        textTheme: TextTheme(
          display1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      home: HomePage(),
    );
  }
}
