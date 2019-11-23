import 'package:flutter/material.dart';
import 'package:wordpress_flutter/model/post_entity.dart';
import 'package:wordpress_flutter/widgets/posts_list.dart';

class SingleCategory extends StatelessWidget {
  PostCategory category;

  SingleCategory(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: PostsList(category: category.id),
    );
  }
}
