import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_chat/core/services/storage_service.dart';

import '../../../../core/config/style/values/app_strings.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  final StorageService storageService;
  WelcomeCubit({required this.storageService}) : super(WelcomeState.initial());

  void setIndex(index) {
    emit(state.copyWith(index: index));
  }

  void saveAlreadyOpen() async {
    emit(state.copyWith(status: WelcomeStatus.loading));
    await Future.delayed(const Duration(milliseconds: 500));
    //TODO: e anche gestire errori (ma ci possono essere con SharedPrefs?)

    storageService.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
    emit(state.copyWith(status: WelcomeStatus.loaded));
  }
}
