import 'dart:async';

import 'package:authentication_repository/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(AppState(user: authenticationRepository.currentUser)) {
    on<AppUserSubscriptionRequested>(_onUserSubReq);
    on<AppUserSignedOut>(_onUserSignOut);
  }
  final AuthenticationRepository _authenticationRepository;

  Future<void> _onUserSubReq(
    AppUserSubscriptionRequested event,
    Emitter<AppState> emit,
  ) {
    return emit.onEach(
      _authenticationRepository.user,
      onData: (user) => emit(AppState(user: user)),
      onError: addError,
    );
  }

  void _onUserSignOut(AppUserSignedOut event, Emitter<AppState> emit) {
    _authenticationRepository.LogOut();
  }
}
