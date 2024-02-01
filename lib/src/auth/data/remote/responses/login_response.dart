import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "nik")
  final String? nik;
  @JsonKey(name: "role_id")
  final int? roleId;
  @JsonKey(name: "status")
  final bool? status;
  @JsonKey(name: "name")
  final String? name;

  const LoginResponse({
    this.id,
    this.nik,
    this.roleId,
    this.status,
    this.name,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
