import 'package:get/get.dart';
import 'package:loomi/domain/entities/movie.dart';
import 'package:loomi/domain/usecases/get_movies_usecase.dart';

class MovieController extends GetxController {
  final GetMoviesUseCase getMoviesUseCase;

  var movies = <Movie>[].obs;
  var isLoading = true.obs;

  MovieController({required this.getMoviesUseCase});

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      final result = await getMoviesUseCase();
      movies.assignAll(result);
    } catch (e) {
      print("Erro ao carregar filmes: $e");
    } finally {
      isLoading(false);
    }
  }
}
