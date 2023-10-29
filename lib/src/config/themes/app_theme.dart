import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/src/core/utils/app_colors.dart';
import '/src/core/utils/app_strings.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        fontFamily: AppStrings.fontFamily,
        brightness: Brightness.light,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 3.h,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        primaryColor: AppColors.primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: AppStrings.fontFamily,
        brightness: Brightness.dark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          elevation: 2.h,
        ),
      );
}
