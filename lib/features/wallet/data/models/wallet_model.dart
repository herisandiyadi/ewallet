import 'package:ewallet/features/wallet/domain/entities/wallet_entity.dart';

class WalletModel {
  final int id;
  final int userId;
  final int balance;
  final String currency;
  final DateTime createdAt;
  final DateTime updatedAt;

  WalletModel({
    required this.id,
    required this.userId,
    required this.balance,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      balance: json['balance'] as int,
      currency: json['currency'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'balance': balance,
      'currency': currency,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  WalletEntity toEntity() {
    return WalletEntity(
      id: id,
      userId: userId,
      balance: balance,
      currency: currency,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static List<WalletModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => WalletModel.fromJson(json)).toList();
  }
}
