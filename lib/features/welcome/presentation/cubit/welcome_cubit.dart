import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'welcome_state.dart';

class WelcomeCubit extends Cubit<WelcomeState> {
  WelcomeCubit() : super(WelcomeState.initial());

  void setIndex(index) {
    print("SET INDEX to $index");
    emit(state.copyWith(index: index));
  }
}
