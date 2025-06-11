import 'dart:developer';

import 'package:ewallet/features/core/utils/dio_services.dart';
import 'package:ewallet/features/auth/data/models/login_request.dart';
import 'package:ewallet/features/auth/data/models/request_registration.dart';
import 'package:ewallet/features/auth/data/models/registration_response.dart';
import 'package:ewallet/features/auth/data/models/response_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

abstract class AuthRemoteDatasource {
  Future<ResponseLogin> login(LoginRequest request);
  Future<RegistrationResponse> registration(RequestRegistration request);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final dio = GetIt.instance<DioClient>().dio;

  @override
  Future<ResponseLogin> login(LoginRequest request) async {
    const storage = FlutterSecureStorage();
    final body = {"email": request.email, "password": request.password};
    final response = await dio.post('/auth/login', data: body);
    log('LOG LOGIN ${response.statusCode}');

    if (response.statusCode == 200) {
      final json = ResponseLogin.fromJson(response.data);
      await storage.write(
        key: 'jwt',
        value: json.accessToken,
        aOptions: const AndroidOptions(),
        iOptions: const IOSOptions(),
      );

      return json;
    }
    throw Exception(response.data['message']);
  }

  @override
  Future<RegistrationResponse> registration(RequestRegistration request) async {
    final body = {
      "email": request.email,
      "password": request.password,
      "name": request.name,
    };
    final response = await dio.post('/auth/register', data: body);
    log('DATA LOG ${response.data}');
    if (response.statusCode == 200) {
      final json = RegistrationResponse.fromJson(response.data);
      return json;
    }
    throw Exception(response.data['message']);
  }
}
