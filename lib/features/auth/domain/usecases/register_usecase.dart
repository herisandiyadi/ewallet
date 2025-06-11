import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/auth/data/models/request_registration.dart';
import 'package:ewallet/features/auth/domain/entities/registration_response_entity.dart';
import 'package:ewallet/features/auth/domain/repositories/auth_repositories.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase({required this.repository});

  Future<Either<Failure, RegistrationResponseEntity>> execute(
    RequestRegistration request,
  ) {
    final dataresp = repository.registration(request);
    return dataresp;
  }
}
