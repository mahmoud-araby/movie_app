import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/component/card_builder.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class TopRated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModule>(builder: (BuildContext context, data, child) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'TopRated',
              style: heading,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, item) => SizedBox(
                  width: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: data.topRated.length,
                itemBuilder: (BuildContext context, item) {
                  print(data.topRated[item].backdropPath);
                  return MovieCard(
                    title: data.topRated[item].title,
                    image: data.topRated[item].backdropPath,
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
