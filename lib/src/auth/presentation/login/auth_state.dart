part of 'auth_bloc.dart';

class AuthLoginStateData extends Equatable {
  final LoginDto? dataLogin;
  final ErrorDto? error;

  const AuthLoginStateData({
    this.dataLogin = const LoginDto(),
    this.error,
  });

  @override
  List<Object?> get props => [dataLogin, error];

  AuthLoginStateData copywith({LoginDto? dataLogin, ErrorDto? error}) {
    return AuthLoginStateData(
      dataLogin: dataLogin,
      error: error,
    );
  }
}

abstract class AuthLoginState extends Equatable {
  const AuthLoginState(this.data);

  final AuthLoginStateData data;

  @override
  List<Object> get props => [data];
}

class AuthLoginInitialState extends AuthLoginState {
  const AuthLoginInitialState() : super(const AuthLoginStateData());
}

class AuthLoginLoadingState extends AuthLoginState {
  const AuthLoginLoadingState(super.data);

  @override
  List<Object> get props => [super.data];
}

class AuthLoginSuccessState extends AuthLoginState {
  const AuthLoginSuccessState(super.data);

  @override
  List<Object> get props => [super.data];
}

class AuthLoginFailedState extends AuthLoginState {
  const AuthLoginFailedState(super.data);

  @override
  List<Object> get props => [super.data];
}
