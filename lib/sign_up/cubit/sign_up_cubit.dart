import 'package:authentication_repository/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authRepo) : super(SignUpInitial());
  final AuthenticationRepository _authRepo;
  void emailStateChanged(String email) {
    emit(state.signUpWithEmail(email));
  }

  void passwordStateChanged(String password) {
    emit(state.signUpWithPassword(password));
  }

  void confirmedPasswordStateChanged(String confirmedPassword) {
    emit(state.signUpWithConfirmedPassword(confirmedPassword));
  }

  Future<void> signUpSubmitted() async {
    emit(state.signUpInProgress());
    try {
      await _authRepo.SignUp(
          email: state.email.value, password: state.password.value);
      emit(state.signUpSucess());
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(state.signUpFailed(e.message));
    } catch (_) {
      emit(state.signUpFailed('Something went wrong while signing up'));
    }
  }
}
