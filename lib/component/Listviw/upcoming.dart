import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/component/card_builder.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class UpComing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModule>(builder: (BuildContext context, data, child) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Upcoming',
              style: heading,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, item) => SizedBox(
                  width: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: data.upcoming.length,
                itemBuilder: (BuildContext context, item) {
                  print(data.upcoming[item].backdropPath);
                  return MovieCard(
                    title: data.upcoming[item].title,
                    image: data.upcoming[item].backdropPath,
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
