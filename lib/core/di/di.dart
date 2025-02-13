import 'package:get/get.dart';
import 'package:loomi/data/datasources/movie_remote_datasource.dart';
import 'package:loomi/data/repositories/movie_repository_impl.dart';
import 'package:loomi/domain/repositories/movie_repository.dart';
import 'package:loomi/domain/usecases/get_movies_usecase.dart';
import 'package:loomi/presentation/controllers/movie_controller.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<MovieRemoteDataSource>(() => MovieRemoteDataSource());
    Get.lazyPut<MovieRepository>(
        () => MovieRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => GetMoviesUseCase(repository: Get.find()));
    Get.put(MovieController(getMoviesUseCase: Get.find()));
  }
}
