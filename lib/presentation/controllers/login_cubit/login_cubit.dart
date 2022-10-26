import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_chat_application/domain/entities/login.dart';

import '../../../core/services/service_locator.dart';
import '../../../domain/usecases/post_login_usecase.dart';



part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Login? model;
  IconData suffix = Icons.visibility_rounded;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_rounded : Icons.visibility_off_rounded;
    emit(ChangePasswordVisibilityState());
  }

  void login({required String email, required String password}) async {
    emit(LoginLoadingState());
    final result = await sl<PostLoginUsecase>().execute(
      data: {
        'email': email,
        'password': password,
      },
    );
    result.fold((l) {
      emit(LoginErrorState(l));
    }, (r) {
      model = r as Login?;
      emit(LoginSuccessState(model));
    });
  }
}
