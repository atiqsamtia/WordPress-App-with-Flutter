import 'package:flutter/material.dart';
import 'package:wordpress_flutter/config.dart';
import 'package:wordpress_flutter/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      theme: ThemeData(
        primarySwatch: APP_COLOR,
      ),
      home: HomePage(),
    );
  }
}
