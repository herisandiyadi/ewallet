// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:ewallet/features/auth/domain/entities/response_login_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:ewallet/features/auth/data/models/login_request.dart';
import 'package:ewallet/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  LoginCubit(this.loginUsecase) : super(LoginInitial());

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final response = await loginUsecase.execute(request);
    response.fold(
      (l) => emit(LoginFailed(l.toString())),
      (r) => emit(LoginLoaded(r)),
    );
  }

  Future<void> logout() async {
    try {
      emit(LoginLoading());
      var storage = const FlutterSecureStorage();
      storage.deleteAll(
        aOptions: const AndroidOptions(),
        iOptions: const IOSOptions(),
      );
      emit(LoginInitial());
    } catch (e) {
      emit(LoginFailed(e.toString()));
    }
  }
}
