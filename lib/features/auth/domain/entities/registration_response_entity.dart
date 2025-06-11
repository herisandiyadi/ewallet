import 'package:equatable/equatable.dart';

class RegistrationResponseEntity extends Equatable {
  final int id;
  final String email;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  const RegistrationResponseEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name, createdAt, updatedAt];
}
