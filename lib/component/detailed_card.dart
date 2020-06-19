import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/Connected_modules/app_module.dart';
import 'package:movieapp/screens/main_page.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';

class DetailedCard extends StatefulWidget {
  @override
  _DetailedCardState createState() => _DetailedCardState();
}

class _DetailedCardState extends State<DetailedCard> {
  bool seeMore = false;
  GlobalKey _image = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final int overviewMaxLength =
        Provider.of<AppModule>(context).detailedMovie.overview.length;
    return Consumer<AppModule>(
      builder: (BuildContext context, data, child) {
        return Material(
          elevation: 15,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: <Widget>[
                          Container(
                            key: _image,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '$imageUrl${data.detailedMovie.backdropPath}',
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      CircularProgressIndicator(
                                          value: downloadProgress.progress),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Material(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(15),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                data.detailedMovie.runtime.toString() + " min",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 221,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.7),
                                    Colors.white.withOpacity(0.1),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                          onPressed: () {
                            launchURL(data.detailedMovie.homepage);
                          },
                          icon: Icon(
                            Icons.play_circle_outline,
                            size: 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => MainPage()));
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                data.detailedMovie.title,
                style: KMovieNameStyle.copyWith(fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RatingBar(
                    allowHalfRating: true,
                    initialRating: data.detailedMovie.voteAverage / 2,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  Text('Vote Count: ' +
                      data.detailedMovie.voteCount.toString() +
                      '  '),
                ],
              ),
              Text(
                "Popularity   : ${data.detailedMovie.popularity == 0 || data.detailedMovie.popularity == null ? "Unknown" : data.detailedMovie.popularity.toString()}",
                style: KBudgetStyle,
              ),
              Text(
                "Budget   : ${data.detailedMovie.budget == 0 || data.detailedMovie.budget == null ? "Unknown" : data.detailedMovie.budget.toString() + " \$"}",
                style: KBudgetStyle,
              ),
              Text(
                "Revenue : ${data.detailedMovie.revenue == 0 || data.detailedMovie.revenue == null ? "Unknown" : data.detailedMovie.revenue.toString() + " \$"}",
                style: KBudgetStyle,
              ),
              Row(
                children: data.detailedMovie.genres != null
                    ? data.detailedMovie.genres
                        .map((e) => Text('$e ,') ?? Text(''))
                        .toList()
                    : <Text>[Text('')],
              ),
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                      text: data.detailedMovie.overview
                          .substring(0, seeMoreLength(overviewMaxLength)),
                    ),
                    TextSpan(text: isSeeMore(overviewMaxLength) ? "..." : ""),
                    WidgetSpan(
                        child: isSeeMore(overviewMaxLength)
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    seeMore = true;
                                  });
                                },
                                child: Text(
                                  "Read More",
                                  style: KReadMoreStyle,
                                ))
                            : Container()),
                  ],
                ),
                style: KOverViewStyle,
              ),
              Text(
                "Release :" + data.detailedMovie.releaseDate,
                style: KMainReleaseDate,
              ),
            ],
          ),
        );
      },
    );
  }

  int seeMoreLength(int overviewMaxLength) {
    int ret = overviewMaxLength;
    if (seeMore == false) {
      if (overviewMaxLength > 90) {
        ret = 90;
      } else {
        ret = overviewMaxLength;
      }
    } else {
      ret = overviewMaxLength;
    }
    return ret;
  }

  bool isSeeMore(int overviewMaxLength) {
    bool ret = false;
    if (seeMore == false) {
      if (overviewMaxLength > 90) {
        ret = true;
      } else {
        ret = false;
      }
    } else {
      ret = false;
    }
    return ret;
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
