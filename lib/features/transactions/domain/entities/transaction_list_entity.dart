import 'package:equatable/equatable.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_entity.dart';

class TransactionListEntity extends Equatable {
  final List<TransactionEntity> transactions;
  final int total;
  final int page;
  final int limit;

  TransactionListEntity({
    required this.transactions,
    required this.total,
    required this.page,
    required this.limit,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [transactions, total, page, limit];
}
