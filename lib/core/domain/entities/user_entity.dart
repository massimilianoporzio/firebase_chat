import 'package:equatable/equatable.dart';

class UserLoginResponseEntity extends Equatable {
  final String? accessToken;
  final String? displayName;
  final String? email;
  final String? photoUrl;

  const UserLoginResponseEntity({
    this.accessToken,
    this.displayName,
    this.email,
    this.photoUrl,
  });

  @override
  String toString() {
    return 'UserLoginresponseEntity(accessToken: $accessToken, displayName: $displayName, email: $email, photoUrl: $photoUrl)';
  }

  @override
  List<Object?> get props => [accessToken, displayName, email, photoUrl];
}
