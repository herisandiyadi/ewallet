import 'package:ewallet/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:ewallet/features/core/presentation/cubit/theme/theme_cubit.dart';
import 'package:ewallet/features/core/shared/loading_widget.dart';
import 'package:ewallet/features/core/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Change Theme'),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Light'),
                  Switch(
                    value: isDark,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
                  const Text('Dark'),
                ],
              ),
            ),
            SizedBox(height: 100),
            BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  LoadingWidget(context).loading(true);
                }
                if (state is LoginInitial) {
                  LoadingWidget(context).loading(false);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  color: orangeCOlor,
                ),
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    context.read<LoginCubit>().logout();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.exit_to_app_outlined, color: whiteColor),
                      const SizedBox(width: 16),
                      Text(
                        'Log Out',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
