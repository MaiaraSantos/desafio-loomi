import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class RegisterWithEmailUseCase {
  final AuthRepository repository;

  RegisterWithEmailUseCase(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.registerWithEmail(email, password);
  }
}
