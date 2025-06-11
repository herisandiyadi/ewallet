import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ewallet/features/auth/data/models/login_request.dart';
import 'package:ewallet/features/auth/data/models/request_registration.dart';
import 'package:ewallet/features/auth/domain/entities/registration_response_entity.dart';
import 'package:ewallet/features/auth/domain/entities/response_login_entity.dart';
import 'package:ewallet/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepositoriesImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoriesImpl({required this.authRemoteDatasource});

  @override
  Future<Either<Failure, ResponseLoginEntity>> login(
    LoginRequest loginRequest,
  ) async {
    try {
      final result = await authRemoteDatasource.login(loginRequest);

      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, RegistrationResponseEntity>> registration(
    RequestRegistration request,
  ) async {
    try {
      final result = await authRemoteDatasource.registration(request);

      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
