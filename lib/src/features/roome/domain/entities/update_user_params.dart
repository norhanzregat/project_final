import 'package:equatable/equatable.dart';

class UpdateUserParams extends Equatable {
  final int? userId;
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? password;
  final String? occupation;
  final String? nationality;
  final String? location;

  final String? profileImage;
  final String? phoneNumber;
  final String? email;

  const UpdateUserParams({
    this.userId,
    this.firstName,
    this.lastName,
    this.username,
    this.occupation,
    this.nationality,
    this.location,
    this.profileImage,
    this.phoneNumber,
    this.email,
    this.password,
  });

  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        username,
        occupation,
        nationality,
        location,
        phoneNumber,
        email,
        profileImage,
        password,
      ];
}
