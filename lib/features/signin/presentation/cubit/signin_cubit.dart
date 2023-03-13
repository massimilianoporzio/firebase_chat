import 'package:equatable/equatable.dart';
import 'package:firebase_chat/core/domain/usecases/base_usecase.dart';
import 'package:firebase_chat/features/signin/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:firebase_chat/features/signin/domain/usecases/google_signin_usecase.dart';

import '../../../../core/domain/entities/user_entity.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final GoogleSignInUsecase googleSignInUsecase;
  SigninCubit({required this.googleSignInUsecase})
      : super(SigninState.initial());

  void handleSignIn() async {
    emit(state.copyWith(status: SigninStatus.loading));
    final response = await googleSignInUsecase(const NoParameters());
    response.fold(
      (failure) {
        emit(
            state.copyWith(status: SigninStatus.error, errMsg: failure.errMsg));
      },
      (profile) {
        emit(state.copyWith(status: SigninStatus.loaded, userProfile: profile));
      },
    );
  }
}
