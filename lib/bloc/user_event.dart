// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserEvent {}

class UserLoadEvent extends UserEvent {
  int? quantity;
  String? gender;

  UserLoadEvent({
    this.quantity,
    this.gender,
  });
}
