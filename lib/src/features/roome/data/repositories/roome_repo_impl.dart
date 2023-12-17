import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/errors/bug.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/server_failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/update_user_params.dart';
import '../datasources/roome_datasource.dart';
import '/src/core/errors/failure.dart';
import '/src/core/models/user_model.dart';
import '/src/features/roome/domain/repositories/roome_repo.dart';

class RoomeRepoImpl extends RoomeRepo {
  final NetworkInfo networkInfo;

  final RoomeDataSource roomeDataSource;

  RoomeRepoImpl({required this.roomeDataSource, required this.networkInfo});

  @override
  void changeBottomNavIndex({
    required BuildContext context,
    required int index,
  }) {
    roomeDataSource.changeBottomNavIndex(
      context: context,
      index: index,
    );
  }

  @override
  void changeBottomNavToHome({
    required BuildContext context,
  }) {
    roomeDataSource.changeBottomNavToHome(context: context);
  }

  @override
  List<Widget> getBody() {
    return roomeDataSource.getBody();
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      roomeDataSource.getBottomNavItems();

  @override
  Future<Either<Failure, UserModel>> getUserData({required int userId}) async {
    if (await networkInfo.isConnected) {
      final response = await roomeDataSource.getUserData(userId: userId);

      if (!response.containsKey('message')) {
        return Left(ServerFailure(errorMessage: response['message']));
      } else {
        final UserModel user = UserModel.fromJson(response['data']);

        return Right(user);
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUser({
    required int userId,
    required UpdateUserParams user,
  }) async {
    if (await networkInfo.isConnected) {
      final response = await roomeDataSource.updateUser(
        userId: userId,
        user: user,
      );

      if (response.containsKey('message')) {
        return Left(ServerFailure(errorMessage: response['message']));
      } else {
        final UserModel user = UserModel.fromJson(response);

        return Right(user);
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }

  @override
  Future<Either<Failure, XFile?>> getProfileImage({
    required ImageSource source,
  }) async {
    try {
      final response = await roomeDataSource.getProfileImage(source: source);

      return Right(response);
    } catch (e) {
      return Left(Bug(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut({required BuildContext context}) async {
    try {
      final result = await roomeDataSource.signOut(context: context);
      return Right(result);
    } catch (e) {
      return Left(Bug(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskSnapshot>> uploadProfileImage({
    File? profileImage,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await roomeDataSource.uploadProfileImage(
            profileImage: profileImage);

        return Right(response);
      } catch (e) {
        return Left(Bug(errorMessage: e.toString()));
      }
    } else {
      throw const ServerException(exception: AppStrings.opps);
    }
  }
}
