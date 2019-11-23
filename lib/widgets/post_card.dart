import 'package:flutter/material.dart';
import 'package:wordpress_flutter/config.dart';
import 'package:wordpress_flutter/pages/post_details.dart';

import '../model/post_entity.dart';

class PostCard extends StatelessWidget {
  PostEntity post;

  PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!post.isDetailCard)
            Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetails(post)));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Material(
          elevation: 14.0,
          borderRadius: BorderRadius.circular(10.0),
          shadowColor: Theme.of(context).primaryColor.withOpacity(.5),
          child: SizedBox(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                FadeInImage.assetNetwork(placeholder: 'images/placeholder.jpg', image: post.image, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
                Positioned(
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Opacity(
                      opacity: 0.8,
                      child: MaterialButton(
                        height: 26.0,
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                        child: Text(post.extra.categories[0].name.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            )),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black, Colors.transparent])),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              post.title,
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            post.extra.author[0].avatar,
                            height: 26.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            post.extra.author[0].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                ),
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 8.0,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
