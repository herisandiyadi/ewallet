import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_entity.dart';
import 'package:ewallet/features/transactions/domain/repositories/transaction_repository.dart';

class PostDepositUsecase {
  final TransactionRepository repository;

  PostDepositUsecase({required this.repository});

  Future<Either<Failure, TransactionEntity>> execute(
    String walletId,
    int amount,
    String description,
  ) {
    final dataresp = repository.postDeposit(walletId, amount, description);
    return dataresp;
  }
}
