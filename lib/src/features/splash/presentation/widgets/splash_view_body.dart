import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '/src/core/utils/app_assets.dart';
import '/src/core/utils/app_strings.dart';
import '/src/core/utils/app_text_styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // الصورة تمتد على عرض الشاشة بالكامل
        Image.asset(
          AppAssets.appIcon,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        // الصورة تمتد على عرض الشاشة بالكامل
        // Image.asset(
        //   AppAssets.imageSplashCover,
        //   width: SizeConfig.screenWidth,
        //   height: SizeConfig.screenHeight,
        // ),
        Positioned(
          top: SizeConfig.screenHeight! * 0.65,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppStrings.appTitle,
                  style: AppTextStyles.splashTextStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
