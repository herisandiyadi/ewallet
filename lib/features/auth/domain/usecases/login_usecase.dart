import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/auth/domain/entities/response_login_entity.dart';
import 'package:ewallet/features/auth/domain/repositories/auth_repositories.dart';

import '../../data/models/login_request.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase({required this.repository});

  Future<Either<Failure, ResponseLoginEntity>> execute(
    LoginRequest loginRequest,
  ) {
    final dataresp = repository.login(loginRequest);
    return dataresp;
  }
}
