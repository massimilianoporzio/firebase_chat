part of 'signin_cubit.dart';

enum SigninStatus {
  initial,
  loading,
  loaded,
  error;
}

class SigninState extends Equatable {
  final SigninStatus status;
  final String? errMsg;
  final UserLoginResponseEntity? userProfile;
  const SigninState({
    required this.status,
    this.errMsg,
    this.userProfile,
  });

  factory SigninState.initial() {
    return const SigninState(status: SigninStatus.initial);
  }

  @override
  String toString() =>
      'SigninState(status: $status, errMsg: $errMsg, userProfile: $userProfile)';

  @override
  List<Object?> get props => [status, errMsg, userProfile];

  SigninState copyWith({
    SigninStatus? status,
    String? errMsg,
    UserLoginResponseEntity? userProfile,
  }) {
    return SigninState(
      status: status ?? this.status,
      errMsg: errMsg ?? this.errMsg,
      userProfile: userProfile ?? this.userProfile,
    );
  }
}
