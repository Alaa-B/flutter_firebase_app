import 'package:authentication_repository/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(const LoginState());
  final AuthenticationRepository _authRepo;
  void emailCahnged(String email) {
    emit(state.loginWithEmail(email));
  }

  void passwordChanged(String password) {
    emit(state.loginWithPassword(password));
  }

  Future<void> loginWithCredentionals() async {
    if (!state.isValidated) return;
    emit(state.loginInProgress());
    try {
      await _authRepo.LogInWithEmailAndPassword(
          email: state.email.value, password: state.password.value);
      emit(state.loginSuccess());
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.loginFailure(e.message));
    } catch (_) {
      emit(state.loginFailure('unknown error happened'));
    }
  }

  Future<void> loginWithGoogle() async {
    emit(state.loginInProgress());
    try {
      await _authRepo.LogInWithGoogle();
      emit(state.loginSuccess());
    } on LogInWithGoogleFailure catch (e) {
      emit(state.loginFailure(e.message));
    } catch (_) {
      emit(state.loginFailure('unknown error happened'));
    }
  }
}
