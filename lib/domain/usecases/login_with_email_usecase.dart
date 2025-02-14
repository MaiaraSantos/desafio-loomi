import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class LoginWithEmailUseCase {
  final AuthRepository repository;

  LoginWithEmailUseCase(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.loginWithEmail(email, password);
  }
}
