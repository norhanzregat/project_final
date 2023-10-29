import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle splashTextStyle = TextStyle(
    fontSize: 60.sp,
    fontWeight: FontWeight.w900,
    decoration: TextDecoration.none,
    decorationColor: AppColors.primaryColor,
    fontFamily: "Skranji",
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 2.w,
    color:Color(0xece7946c),
  );

  static TextStyle onBoardingHeadingTextStyle = TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle onBoardingButtonStyle = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle appBarTextStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black.withOpacity(0.89),
  );

  static TextStyle snackBarTitle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle hintStyle = TextStyle(
    fontSize: 16.sp,
    color: AppColors.hintColor,
  );

  static TextStyle textStyle15 = TextStyle(
    fontSize: 15.sp,
  );

  static TextStyle textStyle14Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
      fontFamily: "Skranji"
  );

  static TextStyle textStyle12 = TextStyle(
    fontSize: 12.sp,
      fontFamily: "Skranji"
  );

  static TextStyle bottomNavTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    fontFamily: "Skranji"
  );
}
