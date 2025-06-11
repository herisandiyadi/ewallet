import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ewallet/features/core/utils/dio_services.dart';
import 'package:ewallet/features/wallet/data/models/wallet_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

abstract class WalletRemoteDatasource {
  Future<WalletModel> createNewWallet(String currency, int initialBalance);
  Future<List<WalletModel>> getListWallet();
  Future<WalletModel> getWalletDetail(String idWallet);
}

class WalletRemoteDatasourceImpl implements WalletRemoteDatasource {
  final dio = GetIt.instance<DioClient>().dio;

  @override
  Future<WalletModel> createNewWallet(
    String currency,
    int initialBalance,
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

    final body = {"currency": currency, "initialBalance": initialBalance};

    try {
      final response = await dio.post(
        '/wallets',
        data: body,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return WalletModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  @override
  Future<List<WalletModel>> getListWallet() async {
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
        '/wallets',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return WalletModel.fromJsonList(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  @override
  Future<WalletModel> getWalletDetail(String idWallet) async {
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
        '/wallets/$idWallet',
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      log('Response Code: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return WalletModel.fromJson(response.data);
      } else {
        throw Exception(response.data['message'] ?? 'Unknown error');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }
}
