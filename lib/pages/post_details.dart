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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          Size size = MediaQuery.of(context).size;
          return <Widget>[
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.white),
              floating: true,
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    Hero(
                      tag: post.image,
                      child: FadeInImage.assetNetwork(
                        image: post.image,
                        placeholder: 'images/placeholder.jpg',
                        width: size.width,
                        height: size.height,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.transparent],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Author(post: post),
                    ),
                    Positioned(
                      bottom: 35.0,
                      child: Container(
                          width: size.width,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  post.title,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CategoryPill(post: post),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: SingleChildScrollView(
          child: Html(
            data: post.content,
            padding: EdgeInsets.all(8.0),
            linkStyle: const TextStyle(
              color: Colors.blueAccent,
              decorationColor: Colors.blueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
