import 'dart:convert';

import 'package:firebase_chat/core/domain/entities/user_entity.dart';
import 'package:firebase_chat/core/errors/exceptions.dart';

import '../../../../core/config/constants/storage_constants.dart';
import '../../../../core/services/storage_service.dart';
import '../models/user_model.dart';
import 'signin_datasource.dart';

class LocalSignInDatasource implements SigninDatasource {
  final StorageService storageService;
  LocalSignInDatasource({
    required this.storageService,
  });

  Future<String?> getAccessToken() async {
    final String? jsonString =
        await storageService.getString(STORAGE_USER_TOKEN_KEY);

    return Future.value(jsonString);
  }

  Future<void> cacheUserProfile(UserLoginResponseModel userModel) async {
    try {
      storageService.setString(
          STORAGE_USER_PROFILE_KEY, json.encode(userModel));
    } catch (e) {
      throw CacheException();
    }
  }

  Future<void> cacheUserToken(String accessToken) async {
    try {
      storageService.setString(STORAGE_USER_TOKEN_KEY, accessToken);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<UserLoginResponseEntity> getUserProfile() async {
    try {
      final String? jsonString =
          await storageService.getString(STORAGE_USER_PROFILE_KEY);
      if (jsonString == null || jsonString.isEmpty) {
        throw CacheException();
      }
      return Future.value(
          UserLoginResponseModel.fromJson(json.decode(jsonString)));
    } on CacheException {
      rethrow;
    } on Exception {
      throw CacheException();
    }
  }
}
