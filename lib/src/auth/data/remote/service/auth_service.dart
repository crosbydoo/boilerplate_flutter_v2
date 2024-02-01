import 'package:bloc_skeleton/core/data/remote/responses/base_response.dart';
import 'package:bloc_skeleton/src/auth/data/remote/requests/login_request.dart';
import 'package:bloc_skeleton/src/auth/data/remote/responses/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) => _AuthService(dio);

  @POST('/auth/login')
  Future<BaseResponse<LoginResponse>> login(@Body() LoginRequest request);
}
