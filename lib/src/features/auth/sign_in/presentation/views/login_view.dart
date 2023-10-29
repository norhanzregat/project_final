import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/routes.dart';
import '../../../../../config/services/notification_service.dart';
import '../../../../../core/helpers/helper.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/loading_dialog.dart';
import '/src/core/helpers/cache_helper.dart';
import '/src/core/utils/app_navigator.dart';
import '/src/core/widgets/custom_snack_bar.dart';
import '/src/features/auth/sign_in/presentation/cubit/login_cubit.dart';
import '/src/features/auth/sign_in/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          controlSignInViewStates(state, context);
        },
        builder: (context, state) {
          LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
          return LoginViewBody(cubit: cubit, state: state);
        },
      ),
    );
  }

  void controlSignInViewStates(LoginState state, BuildContext context) {
    if (state is SignInLoadingState || state is SignInWithGoogleLoadingState) {
      showAdaptiveDialog<Widget>(
        context: context,
        builder: (context) => const LoadingDialog(),
      );
    }
    if (state is SignInSuccessState) {
      _handleSignInSuccessState(context, state);
    }

    if (state is SignInWithGoogleSuccessState) {
      _handleSignInWithGoogleSuccessState(context, state);
    }

    if (state is SignInErrorState) {
      _handleSignInErrorState(context, state);
    }
  }

  void _handleSignInErrorState(BuildContext context, SignInErrorState state) {
    context.getBack();
    CustomSnackBar.show(
      context: context,
      message: state.error,
      title: "Warning",
    );
  }

  void _handleSignInWithGoogleSuccessState(
    BuildContext context,
    SignInWithGoogleSuccessState state,
  ) {
    context.getBack();
    CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
      if (value) {
        Helper.uId = int.parse(state.uId);
        Helper.getUserAndFavorites(context);
        context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
      }
    });
  }

  void _handleSignInSuccessState(
    BuildContext context,
    SignInSuccessState state,
  ) {
    context.getBack();
    CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
      if (value) {
        Helper.uId = state.uId;
        Helper.getUserAndFavorites(context);
        context.navigateAndReplacement(newRoute: Routes.roomViewRoute);
        _weMissedYouNotification(state);
      }
    });
  }

  void _weMissedYouNotification(SignInSuccessState state) {
    NotificationService.triggerNotification(
      title: AppStrings.welcomeBack,
      body:
          'We missed you, ${state.userModel.firstName} ${AppStrings.smilingFaceEmoji}',
    );
  }
}
