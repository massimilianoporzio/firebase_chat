import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../features/auth/data/datasources/local_signin_datasource.dart';
import '../../features/auth/data/datasources/remote_signin_datasource.dart';
import '../../features/auth/data/repositories/signin_repository_impl.dart';
import '../../features/auth/domain/repositories/signin_repository.dart';
import 'storage_service.dart';

import '../../features/welcome/presentation/cubit/welcome_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/domain/usecases/google_signin_usecase.dart';
import '../../features/auth/presentation/cubit/signin_cubit.dart';

final sl = GetIt.asNewInstance();
Future<void> _initSharedPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);
}

Future<void> _initGoogleSignin() async {
  GoogleSignIn google_sign_in = GoogleSignIn(scopes: ['email']);
  sl.registerLazySingleton<GoogleSignIn>(() => google_sign_in);
}

Future<void> init() async {
  //*BLOCS/CUBITS
  sl.registerFactory<WelcomeCubit>(() => WelcomeCubit(storageService: sl()));
  sl.registerFactory<SigninCubit>(() => SigninCubit(googleSignInUsecase: sl()));

  //*usecases
  //SIGN IN WITH GOOGLE
  sl.registerLazySingleton<GoogleSignInUsecase>(
      () => GoogleSignInUsecase(signinRepository: sl()));

  //*REPOSITORIES
  //sign in repo
  sl.registerLazySingleton<SigninRepository>(() => SigninRepositoryImpl(
        localSignInDatasource: sl(),
        remoteSigninDatasource: sl(),
      ));

  //*datasources
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<LocalSignInDatasource>(
      () => LocalSignInDatasource(storageService: sl()));
  sl.registerLazySingleton<RemoteSigninDatasource>(
      () => RemoteSigninDatasource(googleSignIn: sl()));

  //*Externals
  await _initSharedPref();
  await _initGoogleSignin();

  //*Other services
  sl.registerLazySingleton<StorageService>(
      () => StorageService(prefs: sl<SharedPreferences>()));
}
