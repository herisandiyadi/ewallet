import 'package:ewallet/features/core/presentation/cubit/theme/theme_cubit.dart';
import 'package:ewallet/features/core/utils/dio_services.dart';
import 'package:ewallet/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ewallet/features/auth/data/repositories/auth_repositories_impl.dart';
import 'package:ewallet/features/auth/domain/repositories/auth_repositories.dart';
import 'package:ewallet/features/auth/domain/usecases/login_usecase.dart';
import 'package:ewallet/features/auth/domain/usecases/register_usecase.dart';
import 'package:ewallet/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:ewallet/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:ewallet/features/transactions/data/datasources/transaction_remote_datasource.dart';
import 'package:ewallet/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:ewallet/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:ewallet/features/transactions/domain/usecases/get_detail_transaction_usecase.dart';
import 'package:ewallet/features/transactions/domain/usecases/get_list_transaction_usecase.dart';
import 'package:ewallet/features/transactions/domain/usecases/post_deposit_usecase.dart';
import 'package:ewallet/features/transactions/domain/usecases/post_withdrawal_usecase.dart';
import 'package:ewallet/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:ewallet/features/wallet/data/datasources/wallet_remote_datasource.dart';
import 'package:ewallet/features/wallet/data/repositories/wallet_repository_impl.dart';
import 'package:ewallet/features/wallet/domain/repositories/wallet_repository.dart';
import 'package:ewallet/features/wallet/domain/usecases/create_new_wallet_usecase.dart';
import 'package:ewallet/features/wallet/domain/usecases/get_list_wallet_usecase.dart';
import 'package:ewallet/features/wallet/domain/usecases/get_wallet_detail_usecase.dart';
import 'package:ewallet/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //AUTH

  locator.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(),
  );

  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoriesImpl(authRemoteDatasource: locator()),
  );

  locator.registerLazySingleton(() => LoginUsecase(repository: locator()));

  locator.registerLazySingleton(() => RegisterUsecase(repository: locator()));

  locator.registerFactory(() => LoginCubit(locator()));
  locator.registerFactory(() => RegisterCubit(locator()));

  //WALLET

  locator.registerLazySingleton<WalletRemoteDatasource>(
    () => WalletRemoteDatasourceImpl(),
  );

  locator.registerLazySingleton<WalletRepository>(
    () => WalletRepositoryImpl(walletRemoteDatasource: locator()),
  );

  locator.registerLazySingleton(
    () => CreateNewWalletUsecase(repository: locator()),
  );

  locator.registerLazySingleton(
    () => GetWalletDetailUsecase(repository: locator()),
  );
  locator.registerLazySingleton(
    () => GetListWalletUsecase(repository: locator()),
  );

  locator.registerFactory(() => WalletCubit(locator(), locator(), locator()));

  //TRANSACTION

  locator.registerLazySingleton<TransactionRemoteDatasource>(
    () => TransactionRemoteDatasourceImpl(),
  );

  locator.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(transactionRemoteDatasource: locator()),
  );

  locator.registerLazySingleton(
    () => GetDetailTransactionUsecase(repository: locator()),
  );

  locator.registerLazySingleton(
    () => GetListTransactionUsecase(repository: locator()),
  );
  locator.registerLazySingleton(
    () => PostDepositUsecase(repository: locator()),
  );
  locator.registerLazySingleton(
    () => PostWithdrawalUsecase(repository: locator()),
  );

  locator.registerFactory(
    () => TransactionsCubit(locator(), locator(), locator(), locator()),
  );

  locator.registerFactory(() => ThemeCubit());

  locator.registerLazySingleton<DioClient>(
    () => DioClient(
      onNoInternet: () async {
        // if (router.location != '/no-internet') {
        //   router.go('/no-internet');
        // }
      },
    ),
  );
}
