import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ewallet/features/core/utils/dio_services.dart';
import 'package:ewallet/features/transactions/data/models/transaction_list_response.dart';
import 'package:ewallet/features/transactions/data/models/transaction_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

abstract class TransactionRemoteDatasource {
  Future<TransactionModel> postDeposit(
    String walletId,
    int amount,
    String description,
  );
  Future<TransactionModel> postWithdrawal(
    String walletId,
    int amount,
    String description,
  );
  Future<TransactionModel> getDetailTransaction(
    String walletId,
    String idTransaction,
  );
  Future<TransactionListResponse> getListTransactions(
    String walletId,
    String page,
    String limit,
  );
}

class TransactionRemoteDatasourceImpl implements TransactionRemoteDatasource {
  final dio = GetIt.instance<DioClient>().dio;

  @override
  Future<TransactionModel> getDetailTransaction(
    String walletId,
    String idTransaction,
  ) async {
    const storage = FlutterSecureStorage();

    final token = await storage.read(
      key: 'jwt',
      aOptions: const AndroidOptions(),
      iOptions: const IOSOptions(),
    );

    if (token == null) {
      throw Exception('JWT token not found');
    }

    try {
      final response = await dio.get(
        '/wallets/$walletId/transactions/$idTransaction',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TransactionModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  @override
  Future<TransactionListResponse> getListTransactions(
    String walletId,
    String page,
    String limit,
  ) async {
    const storage = FlutterSecureStorage();

    final token = await storage.read(
      key: 'jwt',
      aOptions: const AndroidOptions(),
      iOptions: const IOSOptions(),
    );

    if (token == null) {
      throw Exception('JWT token not found');
    }

    try {
      final response = await dio.get(
        '/wallets/$walletId/transactions?page=$page&limit=$limit',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TransactionListResponse.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  @override
  Future<TransactionModel> postDeposit(
    String walletId,
    int amount,
    String description,
  ) async {
    const storage = FlutterSecureStorage();

    final token = await storage.read(
      key: 'jwt',
      aOptions: const AndroidOptions(),
      iOptions: const IOSOptions(),
    );

    if (token == null) {
      throw Exception('JWT token not found');
    }
    final body = {"amount": amount, "description": description};

    try {
      final response = await dio.post(
        '/wallets/$walletId/transactions/deposit',
        data: body,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TransactionModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  @override
  Future<TransactionModel> postWithdrawal(
    String walletId,
    int amount,
    String description,
  ) async {
    const storage = FlutterSecureStorage();

    final token = await storage.read(
      key: 'jwt',
      aOptions: const AndroidOptions(),
      iOptions: const IOSOptions(),
    );

    if (token == null) {
      throw Exception('JWT token not found');
    }
    final body = {"amount": amount, "description": description};

    try {
      final response = await dio.post(
        '/wallets/$walletId/transactions/withdrawal',
        data: body,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return TransactionModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }
}
