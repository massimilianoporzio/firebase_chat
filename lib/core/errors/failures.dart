import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errMsg;

  const Failure({required this.errMsg});

  @override
  List<Object> get props => [errMsg];

  @override
  String toString() => 'Failure(errMsg: $errMsg)';
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errMsg});

  @override
  String toString() {
    return 'ServerFailure(errMsg: $errMsg)';
  }
}

class FireBaseFailure extends Failure {
  const FireBaseFailure({required super.errMsg});

  @override
  String toString() {
    return 'FireBaseFailure(errMsg: $errMsg)';
  }
}

class GenericFailure extends Failure {
  const GenericFailure({super.errMsg = "Generic Error"});
}

class LocationServiceFailure extends Failure {
  const LocationServiceFailure({required super.errMsg});
}

class CacheFailure extends Failure {
  const CacheFailure({super.errMsg = "Cache Error"});
}

class GoogleSigninFailure extends Failure {
  const GoogleSigninFailure(
      {super.errMsg = "Error during Google sign in process"});
}
