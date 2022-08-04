import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config.dart';
import '../model/post_entity.dart';

class WpApi {
  static const String BASE_URL = URL + REST_URL_PREFIX + '/wp/v2/';

  static Future<List<PostEntity>> getPostsList({int category = 0, int page = 1}) async {
    List<PostEntity> posts = List();
    try {
      String extra = category != 0 ? '&categories=' + '$category' : '';

      dynamic response = await http.get(Uri.parse(BASE_URL + 'posts?_embed&page=$page' + extra));
      dynamic json = jsonDecode(response.body);

      (json as List).forEach((v) {
        posts.add(PostEntity.fromJson(v));
      });
    } catch (e) {
      //TODO Handle No Internet Response
    }
    return posts;
  }

  static Future<List<PostCategory>> getCategoriesList({int page = 1}) async {
    List<PostCategory> categories = List();
    try {
      dynamic response = await http.get(Uri.parse(BASE_URL + 'categories?orderby=count&order=desc&per_page=15&page=$page'));
      dynamic json = jsonDecode(response.body);

      (json as List).forEach((v) {
        categories.add(PostCategory.fromJson(v));
      });
    } catch (e) {
      //TODO Handle No Internet Response
    }
    return categories;
  }
}
