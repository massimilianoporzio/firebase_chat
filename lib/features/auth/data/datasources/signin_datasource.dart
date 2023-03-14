import '../../domain/entities/user_entity.dart';

abstract class SigninDatasource {
  Future<UserLoginResponseEntity> getUserProfile();
}
