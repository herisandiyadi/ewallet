import 'package:ewallet/features/auth/data/models/request_registration.dart';
import 'package:ewallet/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:ewallet/features/core/shared/loading_widget.dart';
import 'package:ewallet/features/core/shared/shared_methods.dart';
import 'package:ewallet/features/core/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            LoadingWidget(context).loading(true);
          }
          if (state is RegisterFailed) {
            LoadingWidget(context).loading(false);
            showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                message:
                    "Something went wrong. Please check your credentials and try again",
              ),
            );
          }
          if (state is RegisterLoaded) {
            LoadingWidget(context).loading(false);
            Alert(
              context: context,
              type: AlertType.success,
              title: "Success",
              desc: "Registration Success",
              buttons: [
                DialogButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  },
                  width: 120,
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ).show();
          }
        },
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 70, horizontal: 70),
              child: Text(
                'EWALLET',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Join Us to Unlock \nYour Growth',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: 327,
              height: 450,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 16,
                    ),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        label: Text(
                          'Name',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                        hintText: 'Input your Name',
                        hintStyle: const TextStyle(color: softGreyColor),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 16,
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 16,
                    ),
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
                          context.read<RegisterCubit>().register(
                            RequestRegistration(
                              email: emailController.text,
                              password: passwordController.text,
                              name:
                                  nameController.text.isEmpty
                                      ? ''
                                      : nameController.text,
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
                        'Register',
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
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
              child: Text(
                'Sign In',
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
