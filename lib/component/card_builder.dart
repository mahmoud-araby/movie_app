import 'package:flutter/material.dart';

import '../constant.dart';

class MovieCard extends StatelessWidget {
  final String image;
  final String title;
  MovieCard({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(Size(200, 300)),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.tight(Size(200, 200)),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('$imageUrl$image'),
              ),
            ),
          ),
          Flexible(
            child: Text(
              title,
              style: movieName,
            ),
          ),
        ],
      ),
    );
  }
}
