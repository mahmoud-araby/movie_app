import 'package:movieapp/Module/detailed_movie_data.dart';
import 'package:movieapp/Module/short_movie_data.dart';

import '../networking/TMBD.dart';

mixin DataExchanger {
  Future<Map<String, dynamic>> getRecommendedMovies(int id, int page) async {
    List<ShortMovieData> ret = [];
    var rawData;
    rawData = await NetworkHelper.getRecommended(id, page);
    if (rawData == null) {
      return null;
    }
    int pages = rawData['total_pages'];
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      ret.add(newMovie);
    });
    return {'list': ret, 'pages': pages};
  }

  Future<Map<String, dynamic>> getSimilarMovies(int id, int page) async {
    List<ShortMovieData> ret = [];
    var rawData;
    rawData = await NetworkHelper.getSimilar(id, page);
    if (rawData == null) {
      return null;
    }
    int pages = rawData['total_pages'];
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      ret.add(newMovie);
    });
    return {'list': ret, 'pages': pages};
  }

  Future<Map<String, dynamic>> getUpcomingMovies(int page) async {
    List<ShortMovieData> list = [];
    var rawData;
    rawData = await NetworkHelper.getUpcoming(page);
    if (rawData == null) {
      return null;
    }
    int pages = rawData['total_pages'];
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      list.add(newMovie);
    });
    return {'list': list, 'pages': pages};
  }

  Future<Map<String, dynamic>> getTrendedMovies(int page) async {
    List<ShortMovieData> list = [];
    var rawData;
    rawData = await NetworkHelper.getTrending(page);
    if (rawData == null) {
      return null;
    }
    int pages = rawData['total_pages'];
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      list.add(newMovie);
    });
    return {'list': list, 'pages': pages};
  }

  Future<Map<String, dynamic>> getPopularMovies(int page) async {
    List<ShortMovieData> ret = [];
    var rawData;
    rawData = await NetworkHelper.getPopular(page);
    if (rawData == null) {
      return null;
    }
    int pages = rawData['total_pages'];
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      ret.add(newMovie);
    });
    return {'list': ret, 'pages': pages};
  }

  Future<Map<String, dynamic>> getTopRatedMovies(int page) async {
    List<ShortMovieData> ret = [];
    var rawData;
    rawData = await NetworkHelper.getTopRated(page);
    if (rawData == null) {
      return null;
    }
    int pages = rawData['total_pages'];
    rawData = rawData['results'];
    rawData.forEach((movie) {
      ShortMovieData newMovie = ShortMovieData.fromJson(movie);
      ret.add(newMovie);
    });
    return {'list': ret, 'pages': pages};
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
