import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/component/card_builder.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../busy_card.dart';
import '../get_more.dart';
import '../no_movies.dart';

class UpComing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModule>(builder: (BuildContext context, data, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Upcoming',
            style: heading,
          ),
          Container(
            height: kCardSize(context),
            child: Material(
              child: data.isBusy
                  ? BusyCard()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.upcoming.moviesList.length + 1,
                      itemBuilder: (BuildContext context, item) {
                        if (data.upcoming.moviesList.length + 1 == 1) {
                          return NoMovies();
                        } else {
                          if (item != data.upcoming.moviesList.length) {
                            print(data.upcoming.moviesList[item].backdropPath);
                            return MovieCard(
                              shortMovieData: data.upcoming.moviesList[item],
                            );
                          } else {
                            if (data.upcoming.currentPage >=
                                data.upcoming.pages) {
                              return Container();
                            } else {
                              return GetMore(data.getMoreUpcomingMovies);
                            }
                          }
                        }
                      },
                    ),
            ),
          ),
        ],
      );
    });
  }
}
