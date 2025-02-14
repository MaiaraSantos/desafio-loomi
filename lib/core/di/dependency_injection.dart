import 'package:get/get.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../domain/usecases/get_movies_usecase.dart';
import '../../presentation/controllers/auth_controller.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_with_email_usecase.dart';
import '../../domain/usecases/login_with_google_usecase.dart';
import '../../domain/usecases/register_with_email_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../presentation/controllers/movie_controller.dart';

class DependencyInjection {
  static void init() {

    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance);
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());

    Get.lazyPut(() => LoginWithEmailUseCase(Get.find()));
    Get.lazyPut(() => LoginWithGoogleUseCase(Get.find()));
    Get.lazyPut(() => RegisterWithEmailUseCase(Get.find()));

    Get.put(AuthController(
      loginWithEmailUseCase: Get.find(),
      loginWithGoogleUseCase: Get.find(),
      registerWithEmailUseCase: Get.find(),
    ), permanent: true);

    Get.lazyPut<MovieRepository>(() => MovieRepositoryImpl());

    Get.lazyPut<GetMoviesUseCase>(() => GetMoviesUseCase(repository: Get.find()));

    Get.lazyPut<MovieController>(() => MovieController(getMoviesUseCase: Get.find()), fenix: true);
  }
}
