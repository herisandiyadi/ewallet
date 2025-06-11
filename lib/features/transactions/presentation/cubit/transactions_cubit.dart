import 'package:equatable/equatable.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_entity.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_list_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ewallet/features/transactions/domain/usecases/get_detail_transaction_usecase.dart';
import 'package:ewallet/features/transactions/domain/usecases/get_list_transaction_usecase.dart';
import 'package:ewallet/features/transactions/domain/usecases/post_deposit_usecase.dart';
import 'package:ewallet/features/transactions/domain/usecases/post_withdrawal_usecase.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final GetDetailTransactionUsecase getDetailTransactionUsecase;
  final GetListTransactionUsecase getListTransactionUsecase;
  final PostDepositUsecase postDepositUsecase;
  final PostWithdrawalUsecase postWithdrawalUsecase;
  TransactionsCubit(
    this.getDetailTransactionUsecase,
    this.getListTransactionUsecase,
    this.postDepositUsecase,
    this.postWithdrawalUsecase,
  ) : super(TransactionsInitial());

  Future<void> getDetailTransaction(
    String walletId,
    String idTransaction,
  ) async {
    emit(TransactionsLoading());
    final response = await getDetailTransactionUsecase.execute(
      walletId,
      idTransaction,
    );
    response.fold(
      (l) => emit(TransactionsFailed(message: l.message)),
      (r) => emit(GetDetailTransactionSuccess(transactionEntity: r)),
    );
  }

  Future<void> getListTransactions(
    String walletId,
    String page,
    String limit,
  ) async {
    emit(TransactionsLoading());
    final response = await getListTransactionUsecase.execute(
      walletId,
      page,
      limit,
    );
    response.fold(
      (l) => emit(TransactionsFailed(message: l.message)),
      (r) => emit(GetlistTransactionSuccess(transactionListEntity: r)),
    );
  }

  Future<void> postDeposit(
    String walletId,
    int amount,
    String description,
  ) async {
    emit(TransactionsLoading());
    final response = await postDepositUsecase.execute(
      walletId,
      amount,
      description,
    );
    response.fold(
      (l) => emit(TransactionsFailed(message: l.message)),
      (r) => emit(PostDepositSuccess(transactionEntity: r)),
    );
  }

  Future<void> postWithdrawal(
    String walletId,
    int amount,
    String description,
  ) async {
    emit(TransactionsLoading());
    final response = await postWithdrawalUsecase.execute(
      walletId,
      amount,
      description,
    );
    response.fold(
      (l) => emit(TransactionsFailed(message: l.message)),
      (r) => emit(PostDepositSuccess(transactionEntity: r)),
    );
  }
}
