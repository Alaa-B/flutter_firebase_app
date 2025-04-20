part of 'login_cubit.dart';

final class LoginState extends Equatable {
  const LoginState() : this._();
  const LoginState._({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  LoginState loginWithEmail(String email) {
    return LoginState._(email: Email.dirty(email), password: password);
  }

  LoginState loginWithPassword(String password) {
    return LoginState._(email: email, password: Password.dirty(password));
  }

  LoginState loginInProgress() {
    return LoginState._(
      email: email,
      password: password,
      status: FormzSubmissionStatus.inProgress,
    );
  }

  LoginState loginSuccess() {
    return LoginState._(
      email: email,
      password: password,
      status: FormzSubmissionStatus.success,
    );
  }

  LoginState loginFailure(String error) {
    return LoginState._(
      email: email,
      password: password,
      status: FormzSubmissionStatus.failure,
      errorMessage: error,
    );
  }

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  bool get isValidated => Formz.validate([email, password]);

  @override
  List<Object> get props => [email, password, status, errorMessage ?? ''];
}

final class LoginInitial extends LoginState {}
