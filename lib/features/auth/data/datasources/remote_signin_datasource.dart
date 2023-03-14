import 'package:firebase_chat/core/errors/exceptions.dart';
import 'package:firebase_chat/features/auth/data/datasources/signin_datasource.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';

class RemoteSigninDatasource implements SigninDatasource {
  final GoogleSignIn googleSignIn;
  RemoteSigninDatasource({
    required this.googleSignIn,
  });
  @override
  Future<UserLoginResponseModel> getUserProfile() async {
    GoogleSignInAccount? userAccount = await googleSignIn.signIn();
    if (userAccount == null) {
      throw GoogleSignInException();
    }
    final user = UserLoginResponseModel(
        accessToken: userAccount.id,
        displayName: userAccount.displayName ?? userAccount.email,
        email: userAccount.email,
        photoUrl: userAccount.photoUrl);

    return Future.value(user);
  }
}
