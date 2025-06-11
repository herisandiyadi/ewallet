import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_entity.dart';
import 'package:ewallet/features/transactions/domain/repositories/transaction_repository.dart';

class GetDetailTransactionUsecase {
  final TransactionRepository repository;

  GetDetailTransactionUsecase({required this.repository});

  Future<Either<Failure, TransactionEntity>> execute(
    String walletId,

    String idTransaction,
  ) {
    final dataresp = repository.getDetailTransaction(walletId, idTransaction);
    return dataresp;
  }
}
