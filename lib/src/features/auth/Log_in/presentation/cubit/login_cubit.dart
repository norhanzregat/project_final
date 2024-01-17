import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roome/src/features/auth/Log_in/domain/entities/login_parameters.dart';
import 'package:roome/src/features/auth/Log_in/domain/usecases/login_with_google_usecase.dart';

import '../../../../../core/entities/no_params.dart';
import '../../domain/usecases/login_usecase.dart';
import '/src/core/models/user_model.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;

  LoginCubit({
    required this.loginUseCase,
    required this.loginWithGoogleUseCase,
  }) : super(LoginInitial());

  bool loginPassVisibility = true;

  void userSignIn({
    required String usernameOrEmail,
    required String password,
  }) {
    emit(SignInLoadingState());

    loginUseCase(LoginParameters(
      usernameOrEmail: usernameOrEmail,
      password: password,
    )).then((value) {
      value.fold(
            (failure) => emit(SignInErrorState(error: failure.errorMessage?.toString() ?? 'Unknown error')),
            (user) {
          emit(SignInSuccessState(
            uId: user.id!,
            userModel: user,
          ));
        },
      );
    });
  }

  void signInWithGoogle() {
    emit(SignInWithGoogleLoadingState());

    loginWithGoogleUseCase(const NoParams()).then((value) {
      value.fold(
            (failure) => emit(
          SignInWithGoogleErrorState(error: failure.errorMessage?.toString() ?? 'Unknown error'),
        ),
            (user) => emit(SignInWithGoogleSuccessState(uId: user.user?.uid ?? '')),
      );
    });
  }

  void switchPassVisibility() {
    loginPassVisibility = !loginPassVisibility;
    emit(SwitchLoginPassVisibleState(passVisibility: loginPassVisibility));
  }

  bool remembered = false;

  void switchRemembered() {
    remembered = !remembered;

    emit(SwitchRememberMeState(remembered: remembered));
  }
}
