import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/component/busy_card.dart';
import 'package:movieapp/component/card_builder.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../get_more.dart';
import '../no_movies.dart';

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModule>(builder: (BuildContext context, data, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popular',
            style: heading,
          ),
          Container(
            height: kCardSize(context),
            child: data.isBusy
                ? BusyCard()
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.popular.moviesList.length + 1,
                    itemBuilder: (BuildContext context, item) {
                      if (data.popular.moviesList.length + 1 == 1) {
                        return NoMovies();
                      } else {
                        if (item != data.popular.moviesList.length) {
                          print(data.popular.moviesList[item].backdropPath);
                          return MovieCard(
                            shortMovieData: data.popular.moviesList[item],
                          );
                        } else {
                          if (data.popular.currentPage >= data.popular.pages) {
                            return Container();
                          } else {
                            return GetMore(data.getMorePopularMovies);
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
