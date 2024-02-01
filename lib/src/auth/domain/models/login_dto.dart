class LoginDto {
  final int id;
  final String nik;
  final int roleId;
  final bool status;
  final String name;

  const LoginDto({
    this.id = 0,
    this.nik = '',
    this.roleId = 0,
    this.status = false,
    this.name = '',
  });

  @override
  String toString() {
    return 'Data User {id: $id, name: $name}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nik': nik,
      'role_id': roleId,
      'status': status,
      'name': name,
    };
  }

  factory LoginDto.fromMap(Map<String, dynamic> map) {
    return LoginDto(
      id: map['id'] as int,
      nik: map['nik'] as String,
      roleId: map['role_id'] as int,
      status: map['status'] as bool,
      name: map['name'] as String,
    );
  }
}
