part of 'welcome_cubit.dart';

class WelcomeState extends Equatable {
  final int index;
  const WelcomeState({
    required this.index,
  });

  factory WelcomeState.initial() => const WelcomeState(index: 0);

  @override
  String toString() => 'WelcomeState(index: $index)';

  @override
  List<Object> get props => [index];

  WelcomeState copyWith({
    int? index,
  }) {
    return WelcomeState(
      index: index ?? this.index,
    );
  }
}
