import '../entities/user.dart';

abstract class AuthRepository {
  Future<UserEntity> registerWithEmail(String email, String password);
  Future<UserEntity> loginWithEmail(String email, String password);
  Future<UserEntity> loginWithGoogle();
  Future<void> logout();
}
