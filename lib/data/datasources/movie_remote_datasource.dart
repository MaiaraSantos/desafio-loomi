import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class MovieRemoteDataSource {
  final String baseUrl = "https://untold-strapi.api.prod.loomi.com.br/api";

  Future<List<MovieModel>> getMovies(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/movies?populate=poster'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List movies = data['data'];
      return movies.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Erro ao buscar filmes");
    }
  }
}
