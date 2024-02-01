import 'package:bloc_skeleton/src/auth/data/remote/responses/login_response.dart';
import 'package:bloc_skeleton/src/auth/domain/models/login_dto.dart';

extension LoginResponseExt on LoginResponse? {
  LoginDto toDto() {
    return LoginDto(
      id: this?.id ?? 0,
      nik: this?.nik ?? '',
      roleId: this?.roleId ?? 0,
      status: this?.status ?? false,
      name: this?.name ?? '',
    );
  }
}
