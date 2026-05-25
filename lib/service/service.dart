import 'package:dio/dio.dart';
import 'package:netfix/model/model.dart';
import 'package:netfix/common/url.dart';

class Service {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Urls.baseUrl,
      queryParameters: {"api_key": Urls.apiKey},
    ),
  );

  Future<List<Model>> getnowPlaying() async {
    try {
      final response = await dio.get(Urls.nowPlaying);

      return (response.data["results"] as List)
          .map((e) => Model.fromjson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception("Now Playing Error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<List<Model>> toprated() async {
    try {
      final response = await dio.get(Urls.toprated);

      return (response.data['results'] as List)
          .map((e) => Model.fromjson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception("Top Rated Error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<List<Model>> upcoming() async {
    try {
      final response = await dio.get(Urls.upcomings);

      return (response.data['results'] as List)
          .map((e) => Model.fromjson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception("Upcoming Error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<List<Model>> tvshows() async {
    try {
      final response = await dio.get(Urls.tvshows);

      return (response.data['results'] as List)
          .map((e) => Model.fromjson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception("TV Shows Error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<List<Model>> overview() async {
    try {
      final response = await dio.get(Urls.nowPlaying);

      return (response.data['results'] as List)
          .map((e) => Model.fromjson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception("Overview Error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }

  Future<List<Model>> serchMovie(String querry) async {
    try {
      final response = await dio.get(
        Urls.search,
        queryParameters: {'query': querry},
      );

      return (response.data['results'] as List)
          .where((movie) => movie['poster_path'] != null)
          .map((e) => Model.fromjson(e))
          .toList();
    } on DioException catch (e) {
      throw Exception("Search Error: ${e.message}");
    } catch (e) {
      throw Exception("Unexpected Error: $e");
    }
  }
}
