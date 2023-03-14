import 'package:dartz/dartz.dart';

import '../../../../core/domain/usecases/base_usecase.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/signin_repository.dart';

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
