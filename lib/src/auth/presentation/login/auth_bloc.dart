import 'package:bloc/bloc.dart';
import 'package:bloc_skeleton/src/auth/data/remote/requests/login_request.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_skeleton/core/domain/models/error_dto.dart';
import 'package:bloc_skeleton/src/auth/domain/models/login_dto.dart';
import 'package:bloc_skeleton/src/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthLoginEvent, AuthLoginState> {
  final LoginUsecase authLoginUseCase;

  var stateData = const AuthLoginStateData();

  AuthBloc({
    required this.authLoginUseCase,
  }) : super(const AuthLoginInitialState()) {
    on<AuthLoginPostEvent>(_onRequestLogin);
  }

  void _onRequestLogin(
      AuthLoginPostEvent event, Emitter<AuthLoginState> emit) async {
    emit(AuthLoginLoadingState(stateData));
    var reqLogin = LoginRequest(nik: event.nik, password: event.password);
    var resultLogin = await authLoginUseCase.execute(reqLogin);

    print('resultBloc $resultLogin');

    resultLogin.fold(
      (error) {
        print('errorFold $error');
        stateData = stateData.copywith(error: error);
        emit(AuthLoginFailedState(stateData.copywith(error: error)));
      },
      ((result) {
        stateData = stateData.copywith(
          dataLogin: result,
          error: null,
        );
        emit(AuthLoginSuccessState(stateData));
      }),
    );
  }
}
