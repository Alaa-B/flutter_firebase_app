part of 'sign_up_cubit.dart';

final class SignUpState extends Equatable {
  const SignUpState() : this._();

  const SignUpState._({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmedPassword = const ConfirmedPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  SignUpState signUpWithEmail(String email) {
    return SignUpState._(
        email: Email.dirty(email),
        password: password,
        confirmedPassword: confirmedPassword);
  }

  SignUpState signUpWithPassword(String password) {
    return SignUpState._(
      email: email,
      password: Password.dirty(password),
      confirmedPassword: confirmedPassword,
    );
  }

  SignUpState signUpWithConfirmedPassword(String confirmedPassword) {
    return SignUpState._(
      email: email,
      password: password,
      confirmedPassword: ConfirmedPassword.dirty(
        password: password.value,
        value: confirmedPassword,
      ),
    );
  }

  SignUpState signUpInProgress() {
    return SignUpState._(
      email: email,
      password: password,
      confirmedPassword: confirmedPassword,
      status: FormzSubmissionStatus.inProgress,
    );
  }

  SignUpState signUpSucess() {
    return SignUpState._(
      email: email,
      password: password,
      confirmedPassword: confirmedPassword,
      status: FormzSubmissionStatus.success,
    );
  }

  SignUpState signUpFailed(String errorMessage) {
    return SignUpState._(
      email: email,
      password: password,
      confirmedPassword: confirmedPassword,
      status: FormzSubmissionStatus.failure,
      errorMessage: errorMessage,
    );
  }

  bool get isValidated => Formz.validate([email, password, confirmedPassword]);

  @override
  List<Object> get props =>
      [email, password, confirmedPassword, status, errorMessage ?? ''];
}

final class SignUpInitial extends SignUpState {}
