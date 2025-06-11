import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/transactions/data/datasources/transaction_remote_datasource.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_entity.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_list_entity.dart';
import 'package:ewallet/features/transactions/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDatasource transactionRemoteDatasource;

  TransactionRepositoryImpl({required this.transactionRemoteDatasource});

  @override
  Future<Either<Failure, TransactionEntity>> getDetailTransaction(
    String walletId,
    String idTransaction,
  ) async {
    try {
      final result = await transactionRemoteDatasource.getDetailTransaction(
        walletId,
        idTransaction,
      );

      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TransactionListEntity>> getListTransactions(
    String walletId,
    String page,
    String limit,
  ) async {
    try {
      final result = await transactionRemoteDatasource.getListTransactions(
        walletId,
        page,
        limit,
      );

      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity>> postDeposit(
    String walletId,
    int amount,
    String description,
  ) async {
    try {
      final result = await transactionRemoteDatasource.postDeposit(
        walletId,
        amount,
        description,
      );

      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TransactionEntity>> postWithdrawal(
    String walletId,
    int amount,
    String description,
  ) async {
    try {
      final result = await transactionRemoteDatasource.postWithdrawal(
        walletId,
        amount,
        description,
      );

      return Right(result.toEntity());
    } on MessageException catch (e) {
      return Left(MessageFailure(e.message));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
