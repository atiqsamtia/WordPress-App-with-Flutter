import 'package:flutter/material.dart';

import '../config.dart';
import '../model/post_entity.dart';
import '../network/wp_api.dart';
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

    WpApi.getPostsList(category: FEATURED_CATEGORY_ID).then((_posts) {
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
