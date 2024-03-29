import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubits/booking_one/booking_one_cubit.dart';
import '/src/config/routes/routes.dart';
import '/src/config/themes/cubit/themes_cubit.dart';
import '/src/core/utils/app_navigator.dart';
import '/src/core/utils/app_text_styles.dart';
import '/src/core/widgets/custom_snack_bar.dart';
import '/src/core/widgets/glowing_custom_button.dart';
import '/src/features/booking/data/models/booked_hotel_info.dart';
import '/src/features/booking/data/models/booking_info.dart';
import '/src/features/booking/presentation/widgets/check_in_and_out.dart';
import '/src/features/booking/presentation/widgets/number_of.dart';
import 'custom_bordered_container.dart';
import 'section_title.dart';

class DateForm extends StatelessWidget {
  const DateForm({
    super.key,
    required this.checkInDate,
    required this.checkOutDate,
    required this.bookedHotelInfo,
    required this.checkInDateTime,
    required this.checkOutDateTime,
  });

  final BookedHotelInfo bookedHotelInfo;
  final String checkInDate;
  final String checkOutDate;
  final DateTime checkInDateTime;
  final DateTime checkOutDateTime;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingOneCubit, BookingOneState>(
      builder: (context, state) {
        final List<String> roomTypes = <String>['Double', 'Single' ];

        BookingOneCubit cubit = BlocProvider.of<BookingOneCubit>(context);

        double computePrice(double price) {
          return price * cubit.roomNumber * cubit.guestNumber *  (checkOutDateTime.difference(checkInDateTime).inDays);
        }

        return Column(
          children: <Widget>[
            CheckInAndOut(
              checkInDate: checkInDate,
              checkOutDate: checkOutDate,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.029),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SectionTitle(title: 'Room Type'),
                SectionTitle(title: 'Number of rooms'),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.022),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomBorderedContainer(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Row(
                    children: <Widget>[
                      Text(
                        cubit.selectedRoomType,
                        style: AppTextStyles.textStyle14Medium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor.withOpacity(0.94),
                        ),
                      ),
                      DropdownButton(
                        borderRadius: BorderRadius.circular(10.r),
                        items: roomTypes
                            .map<DropdownMenuItem<String>>((String type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(
                              type,
                              style: AppTextStyles.textStyle14Medium.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor.withOpacity(0.94),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newVal) {
                          cubit.changeSelectedRoomType(newVal);
                        },
                        icon: BlocBuilder<ThemesCubit, ThemeData>(
                          builder: (context, state) {
                            return Icon(
                              Icons.keyboard_arrow_down,
                              color: state.brightness == Brightness.light
                                  ? Colors.black.withOpacity(0.62)
                                  : Colors.white70,
                            );
                          },
                        ),
                        elevation: 4.w.toInt(),
                        underline: Container(height: 0),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<BookingOneCubit, BookingOneState>(
                  builder: (BuildContext context, BookingOneState state) {
                    BookingOneCubit cubit =
                        BlocProvider.of<BookingOneCubit>(context);
                    return NumberOfContainer(
                      number: cubit.roomNumber,
                      reduceOnTap: cubit.roomNumber == 1
                          ? null
                          : () => cubit.decreaseRoomNumber(),
                      increaseOnTap: () => cubit.increaseRoomNumber(),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.022),
            const Align(
              alignment: Alignment.center,
              child: SectionTitle(title: 'Guest'),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.019),
            NumberOfContainer(
              number: cubit.guestNumber,
              reduceOnTap: cubit.guestNumber == 1
                  ? null
                  : () => cubit.decreaseGuestNumber(),
              increaseOnTap: () => cubit.increaseGuestNumber(),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.030),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                /// Hint
                /*
                you can format Total text

                 */

                Text(
                  'Total: ${(computePrice(bookedHotelInfo.price!)).toStringAsFixed(2)}/night',
                  style: AppTextStyles.textStyle14Medium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15,),
                GlowingCustomButton(
                  onPressed: () => _continueToBookingTwo(
                    context: context,
                    cubit: cubit,
                  ),
                  buttonText: 'Continue',
                ),
              ],
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.014),
          ],
        );
      },
    );
  }

  void _continueToBookingTwo({
    required BuildContext context,
    required BookingOneCubit cubit,
  }) {
    if (checkInDate != '' && checkOutDate != '') {
      context.navigateTo(
        routeName: Routes.bookingTwoViewRoute,
        arguments: BookingInfo(
          hotelName: bookedHotelInfo.hotelName,
          checkInDate: checkInDate,
          checkOutDate: checkOutDate,
          roomNumber: cubit.roomNumber,
          guestNumber: cubit.guestNumber,
          roomType: cubit.selectedRoomType,
        ),
      );
    } else {
      CustomSnackBar.show(
        context: context,
        message: "Check In or Check Out can't be blank!",
        title: 'Warning',
      );
    }
  }
}
