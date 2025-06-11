import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/wallet/domain/entities/wallet_entity.dart';

abstract class WalletRepository {
  Future<Either<Failure, WalletEntity>> createNewWallet(
    String currency,
    int initialBalance,
  );
  Future<Either<Failure, List<WalletEntity>>> getListWallet();
  Future<Either<Failure, WalletEntity>> getWalletDetail(String idWallet);
}
