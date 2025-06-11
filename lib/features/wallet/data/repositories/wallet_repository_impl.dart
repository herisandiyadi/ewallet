import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/wallet/data/datasources/wallet_remote_datasource.dart';
import 'package:ewallet/features/wallet/domain/entities/wallet_entity.dart';
import 'package:ewallet/features/wallet/domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteDatasource walletRemoteDatasource;

  WalletRepositoryImpl({required this.walletRemoteDatasource});

  @override
  Future<Either<Failure, WalletEntity>> createNewWallet(
    String currency,
    int initialBalance,
  ) async {
    try {
      final result = await walletRemoteDatasource.createNewWallet(
        currency,
        initialBalance,
      );

      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<WalletEntity>>> getListWallet() async {
    try {
      final result = await walletRemoteDatasource.getListWallet();

      return Right(result.map((e) => e.toEntity()).toList());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, WalletEntity>> getWalletDetail(String idWallet) async {
    try {
      final result = await walletRemoteDatasource.getWalletDetail(idWallet);

      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
