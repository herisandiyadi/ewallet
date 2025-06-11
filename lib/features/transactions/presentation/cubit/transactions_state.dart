part of 'transactions_cubit.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object> get props => [];
}

class TransactionsInitial extends TransactionsState {}

class TransactionsLoading extends TransactionsState {}

class TransactionsFailed extends TransactionsState {
  final String message;

  TransactionsFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class PostDepositSuccess extends TransactionsState {
  final TransactionEntity transactionEntity;

  PostDepositSuccess({required this.transactionEntity});

  @override
  // TODO: implement props
  List<Object> get props => [transactionEntity];
}

class PostWithdrawalSuccess extends TransactionsState {
  final TransactionEntity transactionEntity;

  PostWithdrawalSuccess({required this.transactionEntity});

  @override
  // TODO: implement props
  List<Object> get props => [transactionEntity];
}

class GetDetailTransactionSuccess extends TransactionsState {
  final TransactionEntity transactionEntity;

  GetDetailTransactionSuccess({required this.transactionEntity});

  @override
  // TODO: implement props
  List<Object> get props => [transactionEntity];
}

class GetlistTransactionSuccess extends TransactionsState {
  final TransactionListEntity transactionListEntity;

  GetlistTransactionSuccess({required this.transactionListEntity});

  @override
  // TODO: implement props
  List<Object> get props => [transactionListEntity];
}
