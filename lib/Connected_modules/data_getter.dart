import 'package:movieapp/Module/detailed_movie_data.dart';
import 'package:movieapp/Module/short_movie_data.dart';

import '../networking/TMBD.dart';

mixin DataExchanger {
  Future<List<ShortMovieData>> getRecommendedMovies(int id) async {
    List<ShortMovieData> ret = [];
    var rawData;
    rawData = await NetworkHelper.getRecommended(id);
    if (rawData == null) {
      return null;
    }
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      ret.add(newMovie);
    });
    return ret;
  }

  Future<List<ShortMovieData>> getSimilarMovies(int id) async {
    List<ShortMovieData> ret = [];
    var rawData;
    rawData = await NetworkHelper.getSimilar(id);
    if (rawData == null) {
      return null;
    }
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      ret.add(newMovie);
    });
    return ret;
  }

  Future<List<ShortMovieData>> getUpcomingMovies() async {
    List<ShortMovieData> ret = [];
    var rawData;
    rawData = await NetworkHelper.getUpcoming();
    if (rawData == null) {
      return null;
    }
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      ret.add(newMovie);
    });
    return ret;
  }

  Future<List<ShortMovieData>> getTrendedMovies() async {
    List<ShortMovieData> ret = [];
    var rawData;
    rawData = await NetworkHelper.getTrending();
    if (rawData == null) {
      return null;
    }
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      ret.add(newMovie);
    });
    return ret;
  }

  Future<List<ShortMovieData>> getPopularMovies() async {
    List<ShortMovieData> ret = [];
    var rawData;
    rawData = await NetworkHelper.getPopular();
    if (rawData == null) {
      return null;
    }
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      ret.add(newMovie);
    });
    return ret;
  }

  Future<List<ShortMovieData>> getTopRatedMovies() async {
    List<ShortMovieData> ret = [];
    var rawData;
    rawData = await NetworkHelper.getTopRated();
    if (rawData == null) {
      return null;
    }
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      ret.add(newMovie);
    });
    return ret;
  }

  Future<DetailedMovieData> getMovieDetails(int id) async {
    DetailedMovieData ret;
    var rawData;
    rawData = await NetworkHelper.getMovieDetail(id);
    if (rawData == null) {
      return null;
    }
    ret = DetailedMovieData.fromJson(rawData);
    return ret;
  }
}
