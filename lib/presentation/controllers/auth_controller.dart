import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  Rxn<String> token = Rxn<String>(); // 🔹 Agora temos um campo `token`

  AuthController({
    required this.loginWithEmailUseCase,
    required this.loginWithGoogleUseCase,
    required this.registerWithEmailUseCase,
  });

  Future<void> loginWithEmail(String email, String password) async {
    try {
      user.value = await loginWithEmailUseCase(email, password);
      await _updateToken(); // 🔹 Obtém o token após login
      Get.offNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar('Erro', 'Falha no login: $e');
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      user.value = await loginWithGoogleUseCase();
      await _updateToken(); // 🔹 Obtém o token após login com Google
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
      await _updateToken(); // 🔹 Obtém o token após registro
      Get.offNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar('Erro', 'Falha no registro: $e');
    }
  }

  Future<void> logout() async {
    user.value = null;
    token.value = null; // 🔹 Resetamos o token ao fazer logout
    Get.offAllNamed(AppRoutes.login);
  }

  Future<void> _updateToken() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      token.value = await user.getIdToken(); // 🔹 Obtém o token do Firebase
    }
  }
}
