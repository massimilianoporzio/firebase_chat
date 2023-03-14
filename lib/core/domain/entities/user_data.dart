import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String? accessToken;
  final String? displayName;
  final String? email;
  final String? photoUrl;

  const UserData({
    this.accessToken,
    this.displayName,
    this.email,
    this.photoUrl,
  });

  @override
  String toString() {
    return 'UserData(accessToken: $accessToken, displayName: $displayName, email: $email, photoUrl: $photoUrl)';
  }

  @override
  List<Object?> get props => [accessToken, displayName, email, photoUrl];
}
