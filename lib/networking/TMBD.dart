import 'dart:convert';

import 'package:http/http.dart' as http;

String site = 'https://api.themoviedb.org/3';
String key = 'c2a5fd588d3823f4468f526bd3e433bf';

class NetworkHelper {
  static Future<Map<String, dynamic>> getSimilar(int id) async {
    try {
      http.Response response = await http
          .get('$site/movie/$id/similar?api_key=$key&language=en-US&page=1');
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> getRecommended(int id) async {
    try {
      http.Response response = await http.get(
          '$site/movie/$id/recommendations?api_key=$key&language=en-US&page=1');
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> getUpcoming() async {
    try {
      http.Response response = await http
          .get('$site/movie/upcoming?api_key=$key&language=en-US&page=1');
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> getTrending() async {
    try {
      http.Response response =
          await http.get('$site/trending/movie/day?api_key=$key');
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> getPopular() async {
    try {
      http.Response response =
          await http.get('$site/movie/popular?api_key=$key&language=en-US');
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> getTopRated() async {
    try {
      http.Response response = await http
          .get('$site/movie/top_rated?api_key=$key&language=en-US&page=1');
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> searchName(
      String name, String type) async {
    try {
      var page = 2;
      http.Response response =
          await http.get('$site/search/$type?api_key=$key&$name=apple&page=1');
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> getMovieDetail(int id) async {
    try {
      http.Response response =
          await http.get('$site/movie/$id?api_key=$key&language=en-US');
      var data = jsonDecode(response.body);
      return data;
    } catch (e) {
      return null;
    }
  }
}
