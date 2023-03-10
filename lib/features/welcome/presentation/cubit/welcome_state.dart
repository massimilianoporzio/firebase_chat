part of 'welcome_cubit.dart';

enum WelcomeStatus { initial, error, loading, loaded }

class WelcomeState extends Equatable {
  final int index;
  final WelcomeStatus status;
  const WelcomeState({
    required this.index,
    required this.status,
  });

  factory WelcomeState.initial() =>
      const WelcomeState(index: 0, status: WelcomeStatus.initial);

  @override
  String toString() => 'WelcomeState(index: $index, status: $status)';

  @override
  List<Object> get props => [index, status];

  WelcomeState copyWith({
    int? index,
    WelcomeStatus? status,
  }) {
    return WelcomeState(
      index: index ?? this.index,
      status: status ?? this.status,
    );
  }
}
