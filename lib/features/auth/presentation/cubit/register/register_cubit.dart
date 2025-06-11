// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:ewallet/features/auth/data/models/request_registration.dart';
import 'package:ewallet/features/auth/domain/entities/registration_response_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ewallet/features/auth/domain/usecases/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterCubit(this.registerUsecase) : super(RegisterInitial());

  Future<void> register(RequestRegistration request) async {
    emit(RegisterLoading());
    final result = await registerUsecase.execute(request);

    result.fold(
      (l) => emit(RegisterFailed(l.message)),
      (r) => emit(RegisterLoaded(r)),
    );
  }
}
