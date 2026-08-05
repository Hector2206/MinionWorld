import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class TmdbService {

  final String apiKey = 'c2f95463d6229b63b549e977fdb887df';

  Future<List<MovieModel>> fetchMovies() async {

    final url = Uri.parse(
      'https://api.themoviedb.org/3/search/movie?query=minions&api_key=$apiKey',
    );

    final response = await http.get(url);

    print(response.body);

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);

      final List results = data['results'];

      return results
          .map((movie) => MovieModel.fromJson(movie))
          .toList();

    } else {

      throw Exception(
        'Error TMDB: ${response.statusCode}',
      );
    }
  }
}