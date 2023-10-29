import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';

import '../utils/app_text_styles.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/utils/app_colors.dart';

class PricePerNightText extends StatelessWidget {
  const PricePerNightText({
    super.key,
    this.fontSize,
    this.mainAxisAlignment,
    this.price,
  });

  final double? price;
  final double? fontSize;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
          children: <Widget>[
            Text(
              price!.toStringAsFixed(1), // السعر من منزله عشريه واحده
              style: AppTextStyles.bottomNavTextStyle.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                color: state.brightness == Brightness.light
                    ? Colors.black.withOpacity(0.6)
                    : Colors.white,
              ),
            ),
            Text(
              '/night',
              style: AppTextStyles.bottomNavTextStyle.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                color: state.brightness == Brightness.light
                    ? Colors.black.withOpacity(0.53) // 25.9/night
                    : AppColors.white38,
              ),
            ),
          ],
        );
      },
    );
  }
}
