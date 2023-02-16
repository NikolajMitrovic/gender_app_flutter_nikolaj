import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:gender_app_flutter/models/model.dart';
import 'package:gender_app_flutter/repositories/repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc(this.userRepository) : super(initialState()) {
    on<UserLoadEvent>(_loadUser);
  }
  static UserState initialState() {
    return UserState(
      status: UserStateStatus.initial,
      user: [],
      quantity: 10,
      gender: '',
    );
  }

  Future<void> _loadUser(UserLoadEvent event, Emitter<UserState> emit) async {
    emit(
      state.copyWith(status: UserStateStatus.loading, quantity: event.quantity, gender: event.gender),
    );
    final result = await userRepository.getGender(
      quantity: event.quantity,
      gender: event.gender,
    );
    if (result != null) {
      emit(
        state.copyWith(
          status: UserStateStatus.loadedSuccess,
          user: result,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: UserStateStatus.loadedError,
        ),
      );
    }
  }
}
