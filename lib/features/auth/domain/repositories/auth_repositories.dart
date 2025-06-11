import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/auth/data/models/login_request.dart';
import 'package:ewallet/features/auth/data/models/request_registration.dart';
import 'package:ewallet/features/auth/domain/entities/registration_response_entity.dart';
import 'package:ewallet/features/auth/domain/entities/response_login_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, ResponseLoginEntity>> login(LoginRequest loginRequest);
  Future<Either<Failure, RegistrationResponseEntity>> registration(
    RequestRegistration request,
  );
}
