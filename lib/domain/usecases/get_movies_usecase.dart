import '../entities/movie.dart';
import '../repositories/movie_repository.dart';

class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase({required this.repository});

  Future<List<Movie>> call() async {
    return await repository.getMovies();
  }
}
