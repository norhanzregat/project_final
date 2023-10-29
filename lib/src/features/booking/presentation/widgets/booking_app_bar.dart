import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '/src/core/utils/app_navigator.dart';

class BookingAppBar extends StatelessWidget {
  const BookingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      spaceBetween: 69,
      title: 'Booking Form',
      arrowOnTap: () => context.getBack(),
    );
  }
}
