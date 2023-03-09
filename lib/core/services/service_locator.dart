import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat/features/welcome/presentation/cubit/welcome_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //*BLOCS/CUBITS
  sl.registerFactory<WelcomeCubit>(() => WelcomeCubit());

  //*datasources
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
