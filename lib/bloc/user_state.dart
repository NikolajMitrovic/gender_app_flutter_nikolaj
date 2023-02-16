// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

enum UserStateStatus {
  initial,
  loading,
  loadedSuccess,
  loadedError,
}

class UserState {
  final UserStateStatus? status;
  final List<UserModel>? user;
  final int? quantity;
  final String? gender;

  UserState({
    this.status,
    this.user,
    this.quantity,
    this.gender,
  });

  UserState copyWith({
    UserStateStatus? status,
    List<UserModel>? user,
    int? quantity,
    String? gender,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
      quantity: quantity ?? this.quantity,
      gender: gender ?? this.gender,
    );
  }
}
