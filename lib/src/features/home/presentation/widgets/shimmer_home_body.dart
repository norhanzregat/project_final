import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '/src/features/home/presentation/widgets/shimmer_hello_row.dart';
import '/src/features/home/presentation/widgets/shimmer_price_slider_and_search.dart';
import '/src/features/home/presentation/widgets/shimmer_tabs.dart';

class ShimmerHomeBody extends StatelessWidget {
  const ShimmerHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 16.h,
          left: 21.w,
        ),
        child: Column(
          children: <Widget>[
            const ShimmerHelloRow(),
            SizedBox(height: SizeConfig.screenHeight! * 0.023),
            const ShimmerPriceSliderAndSearch(),
            const ShimmerTabs(),
          ],
        ),
      ),
    );
  }
}
