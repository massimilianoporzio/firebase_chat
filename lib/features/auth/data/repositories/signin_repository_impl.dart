import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_chat/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_chat/core/config/constants/storage_constants.dart';
import 'package:firebase_chat/core/domain/entities/user_entity.dart';

import 'package:firebase_chat/core/errors/failures.dart';

import '../../domain/repositories/signin_repository.dart';
import '../datasources/local_signin_datasource.dart';
import '../datasources/remote_signin_datasource.dart';
import '../models/user_model.dart';

class SigninRepositoryImpl implements SigninRepository {
  final LocalSignInDatasource localSignInDatasource;
  final RemoteSigninDatasource remoteSigninDatasource;

  SigninRepositoryImpl({
    required this.localSignInDatasource,
    required this.remoteSigninDatasource,
  });

  @override
  Future<Either<Failure, UserLoginResponseEntity>> signInWithGoogle() async {
    try {
      //CHECK SE TOKEN IN CACHE
      String? accessToken = await localSignInDatasource.getAccessToken();
      accessToken = null; //per debug
      if (accessToken != null) {
        //SE LO TROVA PRENDE IL PROFILO DALLA CACHE
        return Right(await localSignInDatasource.getUserProfile());
      } else {
        //ALTRIMENTI LO PRENDE CHIEDENDO A GOOGLE
        final user = await remoteSigninDatasource.getUserProfile();
        //E LO METTE IN CACHE (NON è NULLO se lo fosse avrei eccezione)
        localSignInDatasource.cacheUserProfile(user);
        //E METTE IN CACHE ANCHE IL TOKEN (non nullo per quanto detto)
        localSignInDatasource.cacheUserToken(user.accessToken!);

        return Right(user);
      }
    } on CacheException {
      return Right(await remoteSigninDatasource.getUserProfile());
    } on Exception catch (e) {
      print('Eccezione Generica: $e');
      return const Left(GoogleSigninFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> cacheUserProfile(
      UserLoginResponseModel userModel) async {
    try {
      localSignInDatasource.cacheUserProfile(userModel);
      return const Right(unit);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> cacheUserAccesToken(String accessToken) async {
    try {
      localSignInDatasource.cacheUserToken(accessToken);
      return const Right(unit);
    } catch (e) {
      return const Left(CacheFailure());
    }
  }
}
