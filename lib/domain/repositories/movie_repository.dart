import '../entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies(String token); // 🔹 Agora recebe um token
}
