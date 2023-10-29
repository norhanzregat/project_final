import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class StarIcon extends StatelessWidget {
  const StarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: AppColors.starColor,
      size: 16.w,
    );
  }
}
