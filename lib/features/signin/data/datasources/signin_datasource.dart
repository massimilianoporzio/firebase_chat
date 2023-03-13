import 'package:firebase_chat/core/domain/entities/user_entity.dart';

abstract class SigninDatasource {
  Future<UserLoginResponseEntity> getUserProfile();
}
