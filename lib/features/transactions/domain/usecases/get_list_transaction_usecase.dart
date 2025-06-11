import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_list_entity.dart';
import 'package:ewallet/features/transactions/domain/repositories/transaction_repository.dart';

class GetListTransactionUsecase {
  final TransactionRepository repository;

  GetListTransactionUsecase({required this.repository});

  Future<Either<Failure, TransactionListEntity>> execute(
    String walletId,
    String page,
    String limit,
  ) {
    final dataresp = repository.getListTransactions(walletId, page, limit);
    return dataresp;
  }
}
