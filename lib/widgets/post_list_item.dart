import 'package:flutter/material.dart';

import '../model/post_entity.dart';
import '../pages/post_details.dart';
import '../widgets/helpers.dart';

class PostListItem extends StatelessWidget {
  final PostEntity post;

  PostListItem(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetails(post)));
        },
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedImage(
                  post.image,
                  width: 100,
                  height: 85,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 85.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.title,
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1, //TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0, fontFamily: 'Roboto'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(post.date),
                        Expanded(
                          child: Text(
                            post.category,
                            textAlign: TextAlign.end,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
