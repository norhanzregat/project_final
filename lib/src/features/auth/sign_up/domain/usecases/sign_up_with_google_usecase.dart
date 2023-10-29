import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '/src/core/entities/no_params.dart';
import '/src/core/errors/failure.dart';
import '/src/core/usecases/base_usecase.dart';
import '/src/features/auth/sign_up/domain/repositories/sign_up_repo.dart';

class SignUpWithGoogleUseCase
    implements BaseUseCases<UserCredential, NoParams> {
  final SignUpRepo signUpRepo;

  const SignUpWithGoogleUseCase({required this.signUpRepo});

  @override
  Future<Either<Failure, UserCredential>> call(NoParams params) {
    return signUpRepo.signUpWithGoogle();
  }
}
