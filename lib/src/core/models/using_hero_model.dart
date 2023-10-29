import 'package:equatable/equatable.dart';

import 'hotel.dart';

class UsingHeroModel extends Equatable {
  final Hotel hotel;
  final bool usingHero;

  const UsingHeroModel({required this.hotel, this.usingHero = false});

  @override
  List<Object?> get props => [hotel, usingHero];
}
