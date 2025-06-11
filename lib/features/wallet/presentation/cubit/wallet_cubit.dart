// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:ewallet/features/wallet/domain/entities/wallet_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ewallet/features/wallet/domain/usecases/create_new_wallet_usecase.dart';
import 'package:ewallet/features/wallet/domain/usecases/get_list_wallet_usecase.dart';
import 'package:ewallet/features/wallet/domain/usecases/get_wallet_detail_usecase.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final CreateNewWalletUsecase createNewWalletUsecase;
  final GetListWalletUsecase getListWalletUsecase;
  final GetWalletDetailUsecase getWalletDetailUsecase;

  WalletCubit(
    this.createNewWalletUsecase,
    this.getListWalletUsecase,
    this.getWalletDetailUsecase,
  ) : super(WalletInitial());

  Future<void> createNewWallet(String currency, int initialBalance) async {
    emit(WalletLoading());
    final response = await createNewWalletUsecase.execute(
      currency,
      initialBalance,
    );
    response.fold(
      (l) => emit(WalletFailed(message: l.message)),
      (r) => emit(CreateNewWalletSuccess(walletEntity: r)),
    );
  }

  Future<void> getListWallet() async {
    emit(WalletLoading());
    final response = await getListWalletUsecase.execute();
    response.fold(
      (l) => emit(WalletFailed(message: l.message)),
      (r) => emit(GetListWalletSuccess(walletEntity: r)),
    );
  }

  Future<void> getDetailWallet(String idWallet) async {
    emit(WalletLoading());
    final response = await getWalletDetailUsecase.execute(idWallet);
    response.fold(
      (l) => emit(WalletFailed(message: l.message)),
      (r) => emit(GetDetailWalletSuccess(walletEntity: r)),
    );
  }
}
