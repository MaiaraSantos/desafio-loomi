import 'package:get/get.dart';
import '../../domain/usecases/login_with_email_usecase.dart';
import '../../domain/usecases/login_with_google_usecase.dart';
import '../../domain/usecases/register_with_email_usecase.dart';
import '../../domain/entities/user.dart';
import '../../../core/config/app_routes.dart';

class AuthController extends GetxController {
  final LoginWithEmailUseCase loginWithEmailUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final RegisterWithEmailUseCase registerWithEmailUseCase;

  Rxn<UserEntity> user = Rxn<UserEntity>();

  AuthController({
    required this.loginWithEmailUseCase,
    required this.loginWithGoogleUseCase,
    required this.registerWithEmailUseCase,
  });

  Future<void> loginWithEmail(String email, String password) async {
    try {
      user.value = await loginWithEmailUseCase(email, password);
      Get.offNamed(AppRoutes.home); 
    } catch (e) {
      Get.snackbar('Erro', 'Falha no login: $e');
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      user.value = await loginWithGoogleUseCase();
      Get.offNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar('Erro', 'Falha no login com Google: $e');
    }
  }

  Future<void> registerWithEmail(String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      Get.snackbar('Erro', 'As senhas não coincidem.');
      return;
    }

    try {
      user.value = await registerWithEmailUseCase(email, password);
      Get.offNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar('Erro', 'Falha no registro: $e');
    }
  }

  Future<void> logout() async {
    user.value = null;
    Get.offAllNamed(AppRoutes.login);
  }
}
