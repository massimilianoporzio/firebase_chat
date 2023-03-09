import 'package:firebase_chat/features/welcome/presentation/cubit/welcome_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.asNewInstance();

Future<void> init() async {
  //*BLOCS/CUBITS
  sl.registerFactory<WelcomeCubit>(() => WelcomeCubit());
}
