import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roome/src/features/auth/Log_in/domain/repositories/login_repo.dart';

import '../../../../../core/entities/no_params.dart';
import '/src/core/errors/failure.dart';
import '/src/core/usecases/base_usecase.dart';


class LoginWithGoogleUseCase implements BaseUseCases<UserCredential, NoParams> {
  final LoginRepo loginRepo;

  const LoginWithGoogleUseCase({required this.loginRepo});

  @override
  Future<Either<Failure, UserCredential>> call(NoParams params) {
    return loginRepo.signInWithGoogle();
  }
}
