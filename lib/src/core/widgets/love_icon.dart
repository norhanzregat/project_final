import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/favorite/presentation/cubit/favorite_cubit.dart';
import '../models/hotel.dart';

class LoveIcon extends StatelessWidget {
  const LoveIcon({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        FavoriteCubit cubit = BlocProvider.of<FavoriteCubit>(context);
        return IconButton(
          onPressed: () {
            // if it's in favorite, remove : else add
            cubit.favoriteHotels.contains(hotel)
                ? cubit.removeFromFav(hotelId: hotel.id!)
                : cubit.addToFav(hotelId: hotel.id!);
          },
          icon: Icon(
            Icons.favorite,
            color: cubit.favoriteHotels.contains(hotel)
                ? Colors.red
                : Colors.white,
            size: 18.w,
          ),
        );
      },
    );
  }
}
