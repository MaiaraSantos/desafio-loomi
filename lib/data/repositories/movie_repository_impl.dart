import 'package:loomi/data/datasources/movie_remote_datasource.dart';
import 'package:loomi/domain/entities/movie.dart';
import 'package:loomi/domain/repositories/movie_repository.dart';
import 'package:loomi/data/models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final List<MovieModel> movieModels = await remoteDataSource.getMovies("TOKEN_AQUI");
      
      final List<Movie> movies = movieModels.map((movieModel) => Movie(
        id: movieModel.id,
        title: movieModel.title,
        description: movieModel.description,
        posterUrl: movieModel.posterUrl,
      )).toList();

      return movies;
    } catch (e) {
      throw Exception("Erro ao recuperar filmes");
    }
  }
}
