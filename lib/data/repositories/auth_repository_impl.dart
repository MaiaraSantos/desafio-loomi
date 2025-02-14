import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserEntity> registerWithEmail(String email, String password) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserModel(
      uid: credential.user!.uid,
      email: credential.user!.email!,
      displayName: credential.user!.displayName,
    );
  }

  @override
  Future<UserEntity> loginWithEmail(String email, String password) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return UserModel(
      uid: credential.user!.uid,
      email: credential.user!.email!,
      displayName: credential.user!.displayName,
    );
  }

  @override
  Future<UserEntity> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw Exception('Login cancelado pelo usuário.');
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await _auth.signInWithCredential(credential);

    return UserModel(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email!,
      displayName: userCredential.user!.displayName,
    );
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}
