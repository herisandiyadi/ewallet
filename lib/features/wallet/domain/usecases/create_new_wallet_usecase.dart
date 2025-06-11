import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/wallet/domain/entities/wallet_entity.dart';
import 'package:ewallet/features/wallet/domain/repositories/wallet_repository.dart';

class CreateNewWalletUsecase {
  final WalletRepository repository;

  CreateNewWalletUsecase({required this.repository});

  Future<Either<Failure, WalletEntity>> execute(
    String currency,
    int initialBalance,
  ) {
    final dataresp = repository.createNewWallet(currency, initialBalance);
    return dataresp;
  }
}
