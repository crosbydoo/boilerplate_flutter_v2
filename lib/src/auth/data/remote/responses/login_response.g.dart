// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      id: json['id'] as int?,
      nik: json['nik'] as String?,
      roleId: json['role_id'] as int?,
      status: json['status'] as bool?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nik': instance.nik,
      'role_id': instance.roleId,
      'status': instance.status,
      'name': instance.name,
    };
