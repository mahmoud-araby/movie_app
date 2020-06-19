import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/Module/short_movie_data.dart';
import 'package:movieapp/screens/detailed_page.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class MovieCard extends StatelessWidget {
  final ShortMovieData shortMovieData;
  MovieCard({this.shortMovieData});
  @override
  Widget build(BuildContext context) {
    final int overviewMaxLength = shortMovieData.overview.length;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        elevation: 15,
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            Provider.of<AppModule>(context, listen: false)
                .setDetailedMovie(shortMovieData.id);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DetailedPage()));
          },
          child: Container(
            width: KCardWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  constraints:
                      BoxConstraints.tightFor(width: KCardWidth, height: 198),
                  child: ClipRect(
                    child: CachedNetworkImage(
                      imageUrl: '$imageUrl${shortMovieData.backdropPath}',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      constraints:
                          BoxConstraints.tightFor(width: KCardWidth * 0.88),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            shortMovieData.title,
                            maxLines: 2,
                            softWrap: true,
                            textWidthBasis: TextWidthBasis.longestLine,
                            style: KMovieNameStyle,
                            overflow: TextOverflow.fade,
                          ),
                          Text(
                            "Release Date : " + shortMovieData.releaseDate,
                            style: KReleaseDate,
                          ),
                          Text(
                            "Vote Count : " +
                                shortMovieData.voteCount.toString(),
                            style: KReleaseDate,
                          ),
                          Text(
                            "Popularity : " +
                                shortMovieData.popularity.toString(),
                            style: KReleaseDate,
                          ),
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: shortMovieData.overview.substring(
                                      0, seeMoreLength(overviewMaxLength)),
                                ),
                                TextSpan(
                                    text: isSeeMore(overviewMaxLength)
                                        ? "..."
                                        : ""),
                              ],
                            ),
                            style: KOverViewStyle,
                          ),
                        ],
                      ),
                    ),
                    RatingBar(
                      allowHalfRating: true,
                      initialRating: shortMovieData.voteAverage / 2,
                      direction: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int seeMoreLength(int overviewMaxLength) {
    int ret = overviewMaxLength;
    if (overviewMaxLength > 90) {
      ret = 90;
    } else {
      ret = overviewMaxLength;
    }
    return ret;
  }

  bool isSeeMore(int overviewMaxLength) {
    bool ret = false;

    if (overviewMaxLength > 90) {
      ret = true;
    } else {
      ret = false;
    }
    return ret;
  }
}
