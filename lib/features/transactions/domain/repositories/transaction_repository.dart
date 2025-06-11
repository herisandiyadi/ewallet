import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_entity.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_list_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, TransactionEntity>> postDeposit(
    String walletId,
    int amount,
    String description,
  );
  Future<Either<Failure, TransactionEntity>> postWithdrawal(
    String walletId,
    int amount,
    String description,
  );
  Future<Either<Failure, TransactionEntity>> getDetailTransaction(
    String walletId,
    String idTransaction,
  );
  Future<Either<Failure, TransactionListEntity>> getListTransactions(
    String walletId,
    String page,
    String limit,
  );
}
