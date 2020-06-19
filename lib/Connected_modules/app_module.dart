import 'package:flutter/cupertino.dart';
import 'package:movieapp/Connected_modules/data_getter.dart';
import 'package:movieapp/Module/detailed_movie_data.dart';
import 'package:movieapp/Module/movies_list.dart';

class AppModule extends ChangeNotifier with DataExchanger {
  MoviesList upcoming = MoviesList();
  MoviesList trending = MoviesList();
  MoviesList popular = MoviesList();
  MoviesList topRated = MoviesList();

  DetailedMovieData detailedMovie;
  MoviesList similarMovies = MoviesList();
  MoviesList recommendedMovies = MoviesList();

  bool isBusy = false;
  bool isLoadBusy = false;

  AppModule() {
    dataInitialize();
  }

  setDetailedMovie(int id) async {
    Map<String, dynamic> data;
    isBusy = true;
    notifyListeners();
    similarMovies = MoviesList();
    recommendedMovies = MoviesList();
    detailedMovie = await getMovieDetails(id);
    data = await getSimilarMovies(id, 1);
    similarMovies.moviesList = data['list'];
    similarMovies.pages = data['pages'];
    data = await getRecommendedMovies(id, 1);
    recommendedMovies.moviesList = data['list'];
    recommendedMovies.pages = data['pages'];
    print(recommendedMovies.pages);
    print(similarMovies.pages);
    isBusy = false;
    notifyListeners();
  }

  dataInitialize() async {
    Map<String, dynamic> data;
    isBusy = true;
    notifyListeners();
    data = await getUpcomingMovies(1);
    upcoming.moviesList = data['list'];
    upcoming.pages = data['pages'];
    notifyListeners();
    data = await getTrendedMovies(1);
    trending.moviesList = data['list'];
    trending.pages = data['pages'];
    notifyListeners();
    data = await getTopRatedMovies(1);
    topRated.moviesList = data['list'];
    topRated.pages = data['pages'];
    notifyListeners();
    data = await getPopularMovies(1);
    popular.moviesList = data['list'];
    popular.pages = data['pages'];
    notifyListeners();
    isBusy = false;
    notifyListeners();
  }

  getMoreUpcomingMovies() async {
    Map<String, dynamic> data;
    isLoadBusy = true;
    notifyListeners();
    upcoming.currentPage += 1;
    data = await getUpcomingMovies(upcoming.currentPage);
    upcoming.moviesList.addAll(data['list']);
    upcoming.pages = data['pages'];
    notifyListeners();
    isLoadBusy = true;
    notifyListeners();
  }

  getMoreTrendedMovies() async {
    Map<String, dynamic> data;
    isLoadBusy = true;
    notifyListeners();
    trending.currentPage += 1;
    data = await getTrendedMovies(trending.currentPage);
    trending.moviesList.addAll(data['list']);
    trending.pages = data['pages'];
    notifyListeners();
    isLoadBusy = true;
    notifyListeners();
  }

  getMoreTopRatedMovies() async {
    Map<String, dynamic> data;
    isLoadBusy = true;
    notifyListeners();
    topRated.currentPage += 1;
    data = await getTopRatedMovies(topRated.currentPage);
    topRated.moviesList.addAll(data['list']);
    topRated.pages = data['pages'];
    notifyListeners();
    isLoadBusy = true;
    notifyListeners();
  }

  getMorePopularMovies() async {
    Map<String, dynamic> data;
    isLoadBusy = true;
    notifyListeners();
    popular.currentPage += 1;
    data = await getPopularMovies(popular.currentPage);
    popular.moviesList.addAll(data['list']);
    popular.pages = data['pages'];
    notifyListeners();
    isLoadBusy = true;
    notifyListeners();
  }

  getMoreSimilarMovies() async {
    Map<String, dynamic> data;
    isLoadBusy = true;
    notifyListeners();
    similarMovies.currentPage += 1;
    data = await getSimilarMovies(detailedMovie.id, similarMovies.currentPage);
    similarMovies.moviesList.addAll(data['list']);
    similarMovies.pages = data['pages'];
    notifyListeners();
    isLoadBusy = true;
    notifyListeners();
  }

  getMoreRecommendedMovies() async {
    Map<String, dynamic> data;
    isLoadBusy = true;
    notifyListeners();
    recommendedMovies.currentPage += 1;
    data = await getRecommendedMovies(
        detailedMovie.id, recommendedMovies.currentPage);
    recommendedMovies.moviesList.addAll(data['list']);
    recommendedMovies.pages = data['pages'];
    notifyListeners();
    isLoadBusy = true;
    notifyListeners();
  }
}
