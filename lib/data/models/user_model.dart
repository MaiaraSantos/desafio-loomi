import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.email,
    super.displayName,
  });

  factory UserModel.fromFirebase(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
    );
  }
}
