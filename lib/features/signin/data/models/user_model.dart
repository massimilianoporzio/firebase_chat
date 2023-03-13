import 'package:firebase_chat/core/domain/entities/user_entity.dart';

class UserLoginResponseModel extends UserLoginResponseEntity {
  const UserLoginResponseModel(
      {String? accessToken,
      String? displayName,
      String? email,
      String? photoUrl})
      : super(
          accessToken: accessToken,
          displayName: displayName,
          email: email,
          photoUrl: photoUrl,
        );

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    if (accessToken != null) {
      result.addAll({'accessToken': accessToken});
    }
    if (displayName != null) {
      result.addAll({'displayName': displayName});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (photoUrl != null) {
      result.addAll({'photoUrl': photoUrl});
    }

    return result;
  }

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) {
    return UserLoginResponseModel(
      accessToken: json['accessToken'],
      displayName: json['displayName'],
      email: json['email'],
      photoUrl: json['photoUrl'],
    );
  }
}
