import 'package:ewallet/features/transactions/domain/entities/transaction_entity.dart';

class TransactionModel {
  final int id;
  final int walletId;
  final String type;
  final int amount;
  final String? description;
  final String? referenceId;
  final DateTime timestamp;
  final String? relatedTransactionId;

  TransactionModel({
    required this.id,
    required this.walletId,
    required this.type,
    required this.amount,
    this.description,
    this.referenceId,
    required this.timestamp,
    this.relatedTransactionId,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      walletId: json['walletId'],
      type: json['type'],
      amount: json['amount'],
      description: json['description'] ?? '',
      referenceId: json['referenceId'],
      timestamp: DateTime.parse(json['timestamp']),
      relatedTransactionId: json['relatedTransactionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'walletId': walletId,
      'type': type,
      'amount': amount,
      'description': description,
      'referenceId': referenceId,
      'timestamp': timestamp.toIso8601String(),
      'relatedTransactionId': relatedTransactionId,
    };
  }

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      walletId: walletId,
      type: type,
      amount: amount,
      description: description,
      referenceId: referenceId,
      timestamp: timestamp,
      relatedTransactionId: relatedTransactionId,
    );
  }
}
