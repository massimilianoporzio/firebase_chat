import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_chat/core/services/storage_service.dart';

import '../../../../core/config/constants.dart';

part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  final StorageService storageService;
  WelcomeCubit({required this.storageService}) : super(WelcomeState.initial());

  void setIndex(index) {
    emit(state.copyWith(index: index));
  }

  void saveAlreadyOpen() {
    //TODO: agg status loading per far vedere Spinner
    //TODO: e anche gestire errori
    storageService.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
  }
}
