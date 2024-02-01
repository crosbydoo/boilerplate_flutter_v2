import 'package:bloc_skeleton/src/auth/data/remote/service/auth_service.dart';
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository.dart';
import 'package:bloc_skeleton/src/auth/data/repository/auth_repository_impl.dart';
import 'package:bloc_skeleton/src/auth/domain/usecases/login_usecase.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class LoginDiModule {
  @singleton
  AuthService authService(Dio dio) => AuthService(dio);

  @Singleton(as: AuthRepository)
  AuthRepositoryImpl get authRepository;

  @injectable
  LoginUsecase authLoginUseCase(AuthRepository repository) =>
      LoginUsecase(repository);
}
