import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../model/post_entity.dart';
import '../widgets/post_card.dart';

class FeaturedCategoryList extends StatefulWidget {
  @override
  _FeaturedCategoryListState createState() => _FeaturedCategoryListState();
}

class _FeaturedCategoryListState extends State<FeaturedCategoryList> with AutomaticKeepAliveClientMixin {
  List<PostEntity> posts = new List<PostEntity>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    http.get(URL + "wp-json/wp/v2/posts?_embed&categories=$FEATURED_CATEGORY_ID").then((response) {
      dynamic json = jsonDecode(response.body);

      List<PostEntity> _posts = new List<PostEntity>();
      (json as List).forEach((v) {
        _posts.add(new PostEntity.fromJson(v));
      });

      setState(() {
        isLoading = false;
        posts.addAll(_posts);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: posts?.length ?? 0,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
//            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return PostCard(posts[index], isFeaturedList: true);
            },
          );
  }

  @override
  bool get wantKeepAlive => true;
}
