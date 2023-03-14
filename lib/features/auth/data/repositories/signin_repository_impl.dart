import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/core/errors/exceptions.dart';
import 'package:firebase_chat/features/auth/data/models/user_data_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_chat/core/config/constants/storage_constants.dart';
import 'package:firebase_chat/features/auth/domain/entities/user_entity.dart';

import 'package:firebase_chat/core/errors/failures.dart';

import '../../../../core/services/service_locator.dart';
import '../../domain/entities/user_data_entity.dart';
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
        final googleAccount = await remoteSigninDatasource.signInWithGoogle();
        //POI LO USO PER AUTH SU FIREBASE (NON è nullo se no sarei andato in eccez)
        final gAuth = await googleAccount!.authentication;
        OAuthCredential credential = GoogleAuthProvider.credential(
            idToken: gAuth.idToken, accessToken: gAuth.accessToken);

        final auth = sl<FirebaseAuth>(); //inietto il firebaseAuth
        await auth.signInWithCredential(credential);

        //CREO USERPROFILE DA METTERE IN CACHE
        final user = await remoteSigninDatasource.getUserProfile();
        //E LO METTE IN CACHE (NON è NULLO se lo fosse avrei eccezione)
        localSignInDatasource.cacheUserProfile(user);
        //E METTE IN CACHE ANCHE IL TOKEN (non nullo per quanto detto)
        localSignInDatasource.cacheUserToken(user.accessToken!);

        //CREO USER DATA SU DB DI FIREBASE
        final db = sl<FirebaseFirestore>();
        var userbase = await db
            .collection('users')
            .withConverter(
              fromFirestore: UserDataModel.fromFirestore,
              toFirestore: (UserDataModel userData, options) =>
                  userData.toFirestore(),
            )
            .where("id", isEqualTo: accessToken)
            .get();

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
