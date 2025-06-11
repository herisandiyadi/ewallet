import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final int id;
  final int walletId;
  final String type;
  final int amount;
  final String? description;
  final String? referenceId;
  final DateTime timestamp;
  final String? relatedTransactionId;

  const TransactionEntity({
    required this.id,
    required this.walletId,
    required this.type,
    required this.amount,
    this.description,
    required this.referenceId,
    required this.timestamp,
    required this.relatedTransactionId,
  });

  @override
  List<Object?> get props => [
    id,
    walletId,
    type,
    amount,
    description,
    referenceId,
    timestamp,
    relatedTransactionId,
  ];
}
