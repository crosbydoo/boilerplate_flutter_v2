import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:bloc_skeleton/src/auth/data/remote/requests/login_request.dart';
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository.dart';
import 'package:bloc_skeleton/src/auth/domain/mapper/login_mapper.dart';
import 'package:bloc_skeleton/src/auth/domain/models/login_dto.dart';
import 'package:either_dart/either.dart';

class LoginUsecase {
  final AuthRepository _repository;

  LoginUsecase(this._repository);

  FutureOrError<LoginDto> execute(LoginRequest request) {
    return _repository.login(request).mapRight((response) {
      var loginData = response.data.toDto();
      return loginData;
    });
  }
}
