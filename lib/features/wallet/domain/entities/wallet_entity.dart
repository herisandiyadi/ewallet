import 'package:equatable/equatable.dart';

class WalletEntity extends Equatable {
  final int id;
  final int userId;
  final int balance;
  final String currency;
  final DateTime createdAt;
  final DateTime updatedAt;

  WalletEntity({
    required this.id,
    required this.userId,
    required this.balance,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    userId,
    balance,
    currency,
    createdAt,
    updatedAt,
  ];
}
