import 'package:bloc_skeleton/core/data/remote/responses/base_response.dart';
import 'package:bloc_skeleton/core/utils/future_util.dart';
import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:bloc_skeleton/src/auth/data/remote/requests/login_request.dart';
import 'package:bloc_skeleton/src/auth/data/remote/responses/login_response.dart';
import 'package:bloc_skeleton/src/auth/data/remote/service/auth_service.dart';
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  FutureOrError<BaseResponse<LoginResponse>> login(LoginRequest request) {
    return callOrError(() => _authService.login(request));
  }
}
