import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/core/services/storage_service.dart';
import 'package:firebase_chat/features/welcome/presentation/cubit/welcome_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.asNewInstance();
Future<void> _initSharedPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(prefs);
}

Future<void> init() async {
  //*BLOCS/CUBITS
  sl.registerFactory<WelcomeCubit>(() => WelcomeCubit(storageService: sl()));

  //*datasources
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  //*Externals
  await _initSharedPref();

  //*Other services
  sl.registerLazySingleton<StorageService>(
      () => StorageService(prefs: sl<SharedPreferences>()));
}
