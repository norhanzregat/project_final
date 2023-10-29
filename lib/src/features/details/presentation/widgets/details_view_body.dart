import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../config/routes/routes.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/models/hotel.dart';
import '/src/core/utils/app_colors.dart';
import '/src/core/utils/app_constants.dart';
import '/src/core/utils/app_navigator.dart';
import '/src/core/utils/app_text_styles.dart';
import '/src/core/widgets/glowing_custom_button.dart';
import '/src/core/widgets/location_text.dart';
import '/src/core/widgets/price_per_night_text.dart';
import '/src/features/booking/data/models/booked_hotel_info.dart';
import '/src/features/details/presentation/widgets/details_image_with_hero.dart';
import '/src/features/details/presentation/widgets/facilities.dart';
import 'details_image.dart';
import 'details_section_title.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({
    super.key,
    required this.hotel,
    required this.usingHero,
  });

  final Hotel hotel;
  final bool usingHero;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemesCubit, ThemeData>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                usingHero
                    ? DetailsImageWithHero(hotel: hotel)
                    : DetailsImage(hotel: hotel),
                SizedBox(height: SizeConfig.screenHeight! * 0.031),
                Padding(
                  padding: EdgeInsets.only(left: 9.w),
                  child: FadeInUp(
                    from: AppConstants.fadeInUpValue,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          hotel.name!,
                          style: AppTextStyles.appBarTextStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            color: state.brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight! * 0.014),
                        LocationText(location: hotel.location!),
                        SizedBox(height: SizeConfig.screenHeight! * 0.014),
                        const DetailsSectionTitle(title: 'Description'),
                        SizedBox(height: SizeConfig.screenHeight! * 0.014),
                        Text(
                          hotel.description!,
                          style: AppTextStyles.textStyle14Medium.copyWith(
                            fontSize: 13.sp,
                            color: state.brightness == Brightness.light
                                ? AppColors.lightGrey.withOpacity(0.49)
                                : AppColors.white38,
                          ),
                        ),
                        SizedBox(height: SizeConfig.screenHeight! * 0.02),
                        const DetailsSectionTitle(title: 'Facilities'),
                        SizedBox(height: SizeConfig.screenHeight! * 0.02),
                        Facilities(facilities: hotel.facilities!),
                        SizedBox(height: SizeConfig.screenHeight! * 0.053),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            PricePerNightText(
                              price: hotel.price,
                              fontSize: 20.sp,
                              mainAxisAlignment: MainAxisAlignment.start,
                            ),
                            GlowingCustomButton(
                              onPressed: () => context.navigateTo(
                                routeName: Routes.bookingOneViewRoute,
                                arguments: BookedHotelInfo(
                                  hotelName: hotel.name,
                                  price: hotel.price,
                                ),
                              ),
                              buttonText: 'Book Now',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
