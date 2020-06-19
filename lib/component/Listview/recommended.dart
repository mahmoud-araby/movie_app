import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/component/card_builder.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../busy_card.dart';
import '../get_more.dart';
import '../no_movies.dart';

class Recommended extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModule>(builder: (BuildContext context, data, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Recommended',
            style: heading,
          ),
          Container(
            height: kCardSize(context),
            child: data.isBusy
                ? BusyCard()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.recommendedMovies.moviesList.length + 1,
                    itemBuilder: (BuildContext context, item) {
                      if (data.recommendedMovies.moviesList.length + 1 == 1) {
                        return NoMovies();
                      } else {
                        if (item != data.recommendedMovies.moviesList.length) {
                          return MovieCard(
                            shortMovieData:
                                data.recommendedMovies.moviesList[item],
                          );
                        } else {
                          if (data.recommendedMovies.currentPage >=
                              data.recommendedMovies.pages) {
                            return Container();
                          } else {
                            return GetMore(data.getMoreRecommendedMovies);
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
