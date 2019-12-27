import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/post_entity.dart';
import '../pages/single_category.dart';
import '../widgets/posts_list.dart';
import '../config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostCategory> categories = new List<PostCategory>();

  void getCategoriesList() {
    http.get(URL + "wp-json/wp/v2/categories?orderby=count&order=desc&per_page=15").then((response) {
      dynamic json = jsonDecode(response.body);
      setState(() {
        (json as List).forEach((v) {
          categories.add(new PostCategory.fromJson(v));
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCategoriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(TITLE),
      ),
      drawer: drawer(),
      body: PostsList(),
    );
  }

  Widget drawer() {
    return Drawer(
      child: Container(
        child: ListView.builder(
          itemBuilder: categoryTile,
          itemCount: categories.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
        ),
      ),
    );
  }

  Widget categoryTile(BuildContext context, int index) {
    PostCategory category = categories[index];

    return ListTile(
      title: Text(category.name),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SingleCategory(category)));
      },
    );
  }
}
