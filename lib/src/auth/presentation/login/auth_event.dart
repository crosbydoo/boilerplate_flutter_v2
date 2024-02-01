part of 'auth_bloc.dart';

abstract class AuthLoginEvent extends Equatable {
  const AuthLoginEvent();
}

class AuthLoginInitEvent extends AuthLoginEvent {
  @override
  List<Object> get props => [];
}

class AuthLoginPostEvent extends AuthLoginEvent {
  final String nik;
  final String password;

  const AuthLoginPostEvent({
    this.nik = '',
    this.password = '',
  });

  @override
  List<Object?> get props => [nik, password];
}
