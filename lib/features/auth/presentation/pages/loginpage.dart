import 'package:ewallet/features/auth/data/models/login_request.dart';
import 'package:ewallet/features/auth/presentation/cubit/login/login_cubit.dart';
import 'package:ewallet/features/core/shared/loading_widget.dart';
import 'package:ewallet/features/core/shared/shared_methods.dart';
import 'package:ewallet/features/core/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            LoadingWidget(context).loading(true);
          } else if (state is LoginLoaded) {
            LoadingWidget(context).loading(false);
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          }
          if (state is LoginFailed) {
            LoadingWidget(context).loading(false);
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message: 'Invalid Credential'),
            );
          }
        },
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 110,
              ),
              child: Text(
                'EWALLET',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Sign In & \nGrow Your Finance',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: 327,
              height: 317,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        contentPadding: const EdgeInsets.all(12),
                        label: Text(
                          'Email Address',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        hintText: 'Input your email address',
                        hintStyle: const TextStyle(color: softGreyColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        label: Text(
                          'Password',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        hintText: 'Input your password',
                        isDense: true,
                        hintStyle: const TextStyle(color: softGreyColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56),
                      color: orangeCOlor,
                    ),
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (validate()) {
                          context.read<LoginCubit>().login(
                            LoginRequest(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        } else {
                          showCustomSnackBar(
                            context,
                            'Semua field harus diisi',
                          );
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/register',
                  (route) => false,
                );
              },
              child: Text(
                'Create New Account',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
