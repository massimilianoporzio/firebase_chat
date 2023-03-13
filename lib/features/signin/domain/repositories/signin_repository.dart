import 'package:dartz/dartz.dart';
import 'package:firebase_chat/core/domain/entities/user_entity.dart';
import 'package:firebase_chat/features/signin/data/models/user_model.dart';

import '../../../../core/errors/failures.dart';

abstract class SigninRepository {
  Future<Either<Failure, UserLoginResponseEntity>> signInWithGoogle();
  Future<Either<Failure, Unit>> cacheUserProfile(
      UserLoginResponseModel userModel);
  Future<Either<Failure, Unit>> cacheUserAccesToken(String accesToken);
}
