import 'package:ewallet/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:ewallet/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:ewallet/features/core/presentation/cubit/theme/theme_cubit.dart';
import 'package:ewallet/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:ewallet/features/transactions/presentation/pages/list_transaction_page.dart';
import 'package:ewallet/features/wallet/presentation/cubit/wallet_cubit.dart';

import 'package:ewallet/features/core/presentation/pages/home/home.dart';
import 'package:ewallet/features/core/presentation/pages/home/homepage.dart';
import 'package:ewallet/features/auth/presentation/pages/loginpage.dart';
import 'package:ewallet/features/auth/presentation/pages/register_page.dart';
import 'package:ewallet/features/core/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/core/utils/injection.dart' as di;

void main() async {
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => di.locator<RegisterCubit>()),
            BlocProvider(create: (context) => di.locator<LoginCubit>()),
            BlocProvider(create: (context) => di.locator<WalletCubit>()),
            BlocProvider(create: (context) => di.locator<TransactionsCubit>()),
            BlocProvider(create: (context) => di.locator<ThemeCubit>()),
          ],
          child: BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'E Wallet App',
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode: themeMode,
                routes: {
                  '/': (context) => const SplashScreen(),
                  '/login': (context) => const LoginPage(),
                  '/register': (context) => const RegisterPage(),
                  '/home': (context) => const Home(),
                  '/homepage': (context) => const HomePage(),
                  '/listTransaction':
                      (context) =>
                          const ListTransactionPage(walletId: '', currency: ''),
                },
              );
            },
          ),
        );
      },
    );
  }
}
