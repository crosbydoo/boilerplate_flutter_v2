import 'package:bloc_skeleton/core/domain/models/error_dto.dart';
import 'package:bloc_skeleton/core/domain/models/error_type.dart';
import 'package:bloc_skeleton/core/data/remote/responses/error_response.dart';
import 'package:bloc_skeleton/core/utils/typedef_util.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

FutureOrError<T> callOrError<T>(
  Future<T> Function() block,
) async {
  try {
    print('check try');
    return Right(await block());
  } on DioError catch (e) {
    print('dio error $e');
    switch (e.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return Left(ErrorDto(
          message: 'Connection timeout',
          errorType: ErrorType.connectionTimeout,
          error: e,
        ));
      case DioErrorType.badResponse:
        var statusCode = e.response?.statusCode ?? 0;
        var message = '';
        try {
          var r = ErrorResponse.fromJson(e.response?.data);
          message = r.message ?? '';
        } catch (e) {
          message = 'Unknown Error';
        }

        switch (statusCode) {
          case 400:
            return Left(ErrorDto(
              message: message.isEmpty ? 'Unknown Error' : message,
              errorType: ErrorType.badRequest,
              error: e,
            ));
          case 401:
            return Left(ErrorDto(
              message: message.isEmpty ? 'Unknown Error' : message,
              errorType: ErrorType.unauthorized,
              error: e,
            ));
          case 404:
            return Left(ErrorDto(
              message: message.isEmpty ? 'Unknown Error' : message,
              errorType: ErrorType.notFound,
              error: e,
            ));
          case 500:
            return Left(ErrorDto(
              message: message.isEmpty ? 'Unknown Error' : message,
              errorType: ErrorType.internalServerError,
              error: e,
            ));
          default:
            return Left(ErrorDto(
              message: message.isEmpty ? 'Unknown Error' : message,
              errorType: ErrorType.unknown,
              error: e,
            ));
        }
      default:
        return Left(ErrorDto(
          message: 'Unknown Error',
        ));
    }
  } on Exception catch (e) {
    return Left(ErrorDto(
      message: e.toString(),
      error: e,
    ));
  } on ArgumentError catch (e) {
    return Left(ErrorDto(
      message: e.message,
    ));
  }
}
