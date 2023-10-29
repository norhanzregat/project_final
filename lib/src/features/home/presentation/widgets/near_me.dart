import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../config/routes/routes.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/utils/app_navigator.dart';
import '/src/core/utils/app_text_styles.dart';
import 'explore_list.dart';
import 'near_me_hotels.dart';
import 'offers_list.dart';
import 'see_all_text_button.dart';

class NearMe extends StatelessWidget {
  const NearMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeConfig.screenHeight! * 0.008),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const NearMeHotels(),
          SizedBox(height: SizeConfig.screenHeight! * 0.005),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: SeeAllTextButton(
              onTap: () => context.navigateTo(
                routeName: Routes.nearMeSeeAllViewRoute,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BlocBuilder<ThemesCubit, ThemeData>(
                builder: (context, state) {
                  return Text(
                    'Explore',
                    style: AppTextStyles.hintStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: state.brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  );
                },
              ),
              SeeAllTextButton(
                onTap: () => context.navigateTo(
                  routeName: Routes.exploreSeeAllViewRoute,
                ),
              )
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.011),
          const ExploreList(),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          const OffersList(),
        ],
      ),
    );
  }
}
