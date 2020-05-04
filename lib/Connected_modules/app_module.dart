import 'package:flutter/cupertino.dart';
import 'package:movieapp/Connected_modules/data_getter.dart';
import 'package:movieapp/Module/short_movie_data.dart';

class AppModule extends ChangeNotifier with DataExchanger {
  List<ShortMovieData> upcoming = [];
  List<ShortMovieData> trending = [];
  List<ShortMovieData> popular = [];
  List<ShortMovieData> topRated = [];
  bool isBusy = false;

  AppModule() {
    dataInitialize();
  }

  dataInitialize() async {
    isBusy = true;
    notifyListeners();
    upcoming = await getUpcomingMovies();
    notifyListeners();
    trending = await getTrendedMovies();
    notifyListeners();
    topRated = await getTopRatedMovies();
    notifyListeners();
    popular = await getPopularMovies();
    print(popular.length);
    notifyListeners();
    isBusy = false;
    notifyListeners();
  }
}
