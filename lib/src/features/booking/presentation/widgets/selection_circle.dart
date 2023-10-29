import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roome/src/features/booking/presentation/cubits/payment/payment_cubit.dart';

import '/src/core/utils/app_colors.dart';

class SelectionCircle extends StatelessWidget {
  const SelectionCircle({
    super.key,
    required this.color,
    required this.onTap,
  });

  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 20.w,
            width: 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(color: AppColors.primaryColor, width: 2.w),
            ),
          ),
        );
      },
    );
  }
}
