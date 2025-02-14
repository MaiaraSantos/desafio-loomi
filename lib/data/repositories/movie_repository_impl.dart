import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final String baseUrl = "https://untold-strapi.api.prod.loomi.com.br/api";

  @override
  Future<List<Movie>> getMovies(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/movies?populate=poster'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List movies = data['data'];

        return movies.map((movie) {
          final movieModel = MovieModel.fromJson(movie);
          return Movie(
            id: movieModel.id,
            title: movieModel.title,
            description: movieModel.description,
            posterUrl: movieModel.posterUrl,
          );
        }).toList();
      } else {
        throw Exception('Erro ao buscar filmes: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao recuperar filmes: $e');
    }
  }
}
