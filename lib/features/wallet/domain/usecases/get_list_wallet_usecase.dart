import 'package:dartz/dartz.dart';
import 'package:ewallet/features/core/utils/exceptions.dart';
import 'package:ewallet/features/wallet/domain/entities/wallet_entity.dart';
import 'package:ewallet/features/wallet/domain/repositories/wallet_repository.dart';

class GetListWalletUsecase {
  final WalletRepository repository;

  GetListWalletUsecase({required this.repository});

  Future<Either<Failure, List<WalletEntity>>> execute() {
    final dataresp = repository.getListWallet();
    return dataresp;
  }
}
