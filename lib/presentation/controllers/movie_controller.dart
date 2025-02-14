import 'package:get/get.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import '../controllers/auth_controller.dart';

class MovieController extends GetxController {
  final GetMoviesUseCase getMoviesUseCase;
  AuthController? authController;

  var movies = <Movie>[].obs;
  var isLoading = true.obs;

  MovieController({required this.getMoviesUseCase});

  @override
  void onInit() {
    authController = Get.find<AuthController>();
    super.onInit();
  }

  void fetchMovies() async {
    if (authController!.token.value == null) {
      print("Erro: Token não encontrado");
      return;
    }

    try {
      isLoading(true);
      final result = await getMoviesUseCase(authController!.token.value!);
      movies.assignAll(result);
    } catch (e) {
      print("Erro ao carregar filmes: $e");
    } finally {
      isLoading(false);
    }
  }
}
