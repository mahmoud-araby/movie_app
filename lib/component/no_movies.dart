import 'package:flutter/material.dart';

import '../constant.dart';

class NoMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        elevation: 15,
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.hardEdge,
        child: Container(
          width: KCardWidth,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('We are Sorry'),
                Text('This Category is Empty'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
