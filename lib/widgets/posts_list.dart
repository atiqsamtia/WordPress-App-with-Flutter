import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../model/post_entity.dart';
import 'post_card.dart';

class PostsList extends StatefulWidget {
  int category = 0;

  PostsList({this.category = 0});

  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  List<PostEntity> posts = new List<PostEntity>();

  int page = 0;
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;

  void getData() {
    if (!isLoading) {
      setState(() {
        page++;
        isLoading = true;
      });

      String extra = widget.category != 0 ? "&categories=" + widget.category.toString() : "";

      http.get(URL + "wp-json/wp/v2/posts?_embed&page=$page" + extra).then((response) {
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
  }

  @override
  void initState() {
    super.initState();
    getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        getData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemBuilder: postTile,
        itemCount: posts.length + 1,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        controller: _scrollController,
      ),
    );
  }

  Widget postTile(BuildContext context, int index) {
    if (index == posts.length) {
      return _buildProgressIndicator();
    } else {
      return PostCard(posts[index]);
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}
