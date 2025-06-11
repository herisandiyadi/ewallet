import 'package:ewallet/features/transactions/data/models/transaction_model.dart';
import 'package:ewallet/features/transactions/domain/entities/transaction_list_entity.dart';

class TransactionListResponse {
  final List<TransactionModel> transactions;
  final int total;
  final int page;
  final int limit;

  TransactionListResponse({
    required this.transactions,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory TransactionListResponse.fromJson(Map<String, dynamic> json) {
    return TransactionListResponse(
      transactions:
          (json['transactions'] as List)
              .map((e) => TransactionModel.fromJson(e))
              .toList(),
      total: json['total'],
      page: json['page'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transactions': transactions.map((e) => e.toJson()).toList(),
      'total': total,
      'page': page,
      'limit': limit,
    };
  }

  TransactionListEntity toEntity() {
    return TransactionListEntity(
      transactions: transactions.map((e) => e.toEntity()).toList(),
      total: total,
      page: page,
      limit: limit,
    );
  }
}
