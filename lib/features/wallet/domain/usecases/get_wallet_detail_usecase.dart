import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/wallet/domain/entities/wallet_entity.dart';
import 'package:ewallet/features/wallet/domain/repositories/wallet_repository.dart';

class GetWalletDetailUsecase {
  final WalletRepository repository;

  GetWalletDetailUsecase({required this.repository});

  Future<Either<Failure, WalletEntity>> execute(String idWallet) {
    final dataresp = repository.getWalletDetail(idWallet);
    return dataresp;
  }
}
