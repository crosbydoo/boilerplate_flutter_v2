import 'package:bloc_skeleton/core/data/remote/responses/base_response.dart';
import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:bloc_skeleton/src/auth/data/remote/requests/login_request.dart';
import 'package:bloc_skeleton/src/auth/data/remote/responses/login_response.dart';

abstract class AuthRepository {
  FutureOrError<BaseResponse<LoginResponse>> login(LoginRequest request);
}
