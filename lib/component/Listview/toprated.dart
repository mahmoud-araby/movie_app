import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/component/card_builder.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../busy_card.dart';
import '../get_more.dart';
import '../no_movies.dart';

class TopRated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModule>(builder: (BuildContext context, data, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'TopRated',
            style: heading,
          ),
          Container(
            height: kCardSize(context),
            child: data.isBusy
                ? BusyCard()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.topRated.moviesList.length + 1,
                    itemBuilder: (BuildContext context, item) {
                      if (data.topRated.moviesList.length + 1 == 1) {
                        return NoMovies();
                      } else {
                        if (item != data.topRated.moviesList.length) {
                          print(data.topRated.moviesList[item].backdropPath);
                          return MovieCard(
                            shortMovieData: data.topRated.moviesList[item],
                          );
                        } else {
                          if (data.topRated.currentPage >=
                              data.topRated.pages) {
                            return Container();
                          } else {
                            return GetMore(data.getMoreTopRatedMovies);
                          }
                        }
                      }
                    },
                  ),
          ),
        ],
      );
    });
  }
}
