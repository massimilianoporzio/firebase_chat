import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/entities/user_entity.dart';
import '../../../../core/domain/usecases/base_usecase.dart';
import '../../domain/usecases/google_signin_usecase.dart';

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
