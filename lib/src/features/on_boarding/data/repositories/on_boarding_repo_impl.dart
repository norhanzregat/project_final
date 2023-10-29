import 'package:flutter/material.dart';

import '/src/features/on_boarding/data/datasources/on_boarding_datasource.dart';
import '/src/features/on_boarding/domain/entities/on_boarding_entity.dart';
import '/src/features/on_boarding/domain/repositories/on_boarding_repo.dart';

class OnBoardingRepoImpl extends OnBoardingRepo {
  final OnBoardingDataSource onBoardingDataSource;

  OnBoardingRepoImpl({required this.onBoardingDataSource});

  @override
  List<OnBoardingEntity> getPages() {
    return onBoardingDataSource.getPages();
  }

  @override
  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
    required bool isLastBoarding,
  }) {
    onBoardingDataSource.navigateBetweenPages(
      context: context,
      pageController: pageController,
      isLastBoarding: isLastBoarding,
    );
  }

  @override
  void navigateToLoginOrHome({required BuildContext context}) {
    onBoardingDataSource.navigateToLoginOrHome(context: context);
  }

  @override
  void previousPage({required PageController pageController}) {
    onBoardingDataSource.previousPage(pageController: pageController);
  }
}
