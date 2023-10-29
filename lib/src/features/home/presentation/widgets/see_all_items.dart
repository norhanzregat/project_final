import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../core/models/hotel.dart';
import '../../../../core/widgets/separator_widget.dart';
import '/src/features/home/presentation/widgets/popular_card.dart';

class SeeAllItems extends StatelessWidget {
  const SeeAllItems({super.key, required this.hotels});

  final List<Hotel> hotels;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(top: 15.h),
      shrinkWrap: true,
      itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 700),
        child: SlideAnimation(
          horizontalOffset: -150.w,
          curve: Curves.fastLinearToSlowEaseIn,
          child: FadeInAnimation(
            child: PopularCard(
              hotel: hotels[index],
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SeparatorWidget(height: 33),
      itemCount: hotels.length,
    );
  }
}
