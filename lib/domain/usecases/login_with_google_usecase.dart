import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class LoginWithGoogleUseCase {
  final AuthRepository repository;

  LoginWithGoogleUseCase(this.repository);

  Future<UserEntity> call() {
    return repository.loginWithGoogle();
  }
}
