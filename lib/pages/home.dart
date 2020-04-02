import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../model/post_entity.dart';
import '../pages/single_category.dart';
import '../widgets/featured_category_list.dart';
import '../widgets/posts_list.dart';

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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListHeading(FEATURED_CATEGORY_TITLE, FEATURED_CATEGORY_ID),
              Container(
                height: 250.0,
                child: FeaturedCategoryList(),
              ),
              ListHeading('Latest', 0),
              Flexible(
                fit: FlexFit.loose,
                child: PostsList(),
              ),
            ],
          ),
        ),
      ),
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

class ListHeading extends StatelessWidget {
  final String title;
  final int categoryId;

  ListHeading(this.title, this.categoryId);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.display1,
          ),
          GestureDetector(
            onTap: () {
              PostCategory category = PostCategory(name: title, id: categoryId);
              Navigator.push(context, MaterialPageRoute(builder: (context) => SingleCategory(category)));
            },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.grey.shade300),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Text('Show All'),
            ),
          )
        ],
      ),
    );
  }
}
