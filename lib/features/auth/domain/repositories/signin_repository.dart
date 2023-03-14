import 'package:dartz/dartz.dart';
import '../../../../core/domain/entities/user_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../data/models/user_model.dart';

abstract class SigninRepository {
  Future<Either<Failure, UserLoginResponseEntity>> signInWithGoogle();
  Future<Either<Failure, Unit>> cacheUserProfile(
      UserLoginResponseModel userModel);
  Future<Either<Failure, Unit>> cacheUserAccesToken(String accesToken);
}
