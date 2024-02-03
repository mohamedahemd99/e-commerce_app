import 'package:ecommerce_app/core/utils/navigation/navigator.dart';
import 'package:ecommerce_app/features/auth/login/login_view.dart';
import 'package:ecommerce_app/features/auth/model/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/preferences/pref_manager.dart';
import '../../profile/model/profile_model.dart';
import '../service/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthInitial()) {
    // on<AuthInitialized>((_onInitialized));
  }
  void login(Map<String, dynamic> data, BuildContext context) async {
    final AuthService authService = AuthService();

    emit(const AuthInitial());
    try {
      emit(
        AuthLoad(
            isLoading: false,
            userLoginModel:
                await authService.login(data: data, context: context)),
      );
    } catch (_) {
      emit(AuthError());
    }
  }

  void register(Map<String, dynamic> data, BuildContext context) async {
    final AuthService authService = AuthService();

    emit(const RegisterInitial());
    try {
      emit(
        RegisterLoad(
            isLoading: false,
            registerModel:
                await authService.register(data: data, context: context)),
      );
    } catch (_) {
      emit(RegisterError());
    }
  }

  void logout(BuildContext context) async {
    emit(const RegisterInitial());
    try {
      PrefManager.clearSharedPreferences();

      popAllAndPushName(context, LoginView.id);
      emit(const RegisterLoad());
    } catch (_) {
      emit(RegisterError());
    }
  }
}
