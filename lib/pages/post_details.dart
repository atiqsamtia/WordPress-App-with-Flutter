import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../model/post_entity.dart';
import '../widgets/post_card.dart';

class PostDetails extends StatelessWidget {
  PostEntity post;

  PostDetails(this.post);

  @override
  Widget build(BuildContext context) {
//    post.isDetailCard = true;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PostCard(post),
            Html(
              data: post.content,
              padding: EdgeInsets.all(8.0),
              linkStyle: const TextStyle(
                color: Colors.blueAccent,
                decorationColor: Colors.blueAccent,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        ),
      ),
    );
  }
}
