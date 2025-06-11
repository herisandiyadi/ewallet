import 'package:ewallet/features/auth/domain/entities/registration_response_entity.dart';

class RegistrationResponse {
  final int id;
  final String email;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  RegistrationResponse({
    required this.id,
    required this.email,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  RegistrationResponseEntity toEntity() {
    return RegistrationResponseEntity(
      id: id,
      email: email,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
