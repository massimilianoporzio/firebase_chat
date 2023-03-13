import 'package:dartz/dartz.dart';

import 'package:firebase_chat/core/domain/usecases/base_usecase.dart';
import 'package:firebase_chat/core/errors/failures.dart';
import 'package:firebase_chat/features/signin/data/repositories/signin_repository_impl.dart';
import 'package:firebase_chat/features/signin/domain/repositories/signin_repository.dart';

class GoogleSignInUsecase extends BaseUseCase {
  final SigninRepository signinRepository;
  GoogleSignInUsecase({
    required this.signinRepository,
  });

  @override
  Future<Either<Failure, dynamic>> call(parameters) async {
    return await signinRepository.signInWithGoogle();
  }
}
