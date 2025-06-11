import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:ewallet/features/core/shared/constants.dart';

typedef NoInternetHandler = Future<void> Function();

class DioClient {
  late final Dio dio;

  DioClient({required NoInternetHandler onNoInternet}) {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        logPrint: print,
        retries: 2,
        retryDelays: const [Duration(seconds: 2), Duration(seconds: 3)],
        toNoInternetPageNavigator: onNoInternet,
      ),
    );
  }
}
