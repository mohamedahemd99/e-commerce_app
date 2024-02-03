import 'package:ecommerce_app/core/base/view/base_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/navigation/navigator.dart';
import '../../../core/utils/preferences/pref_manager.dart';
import '../../auth/login/login_view.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5)).then((value) =>
        pushNameReplacement(context,
            PrefManager.getToken() != null ? BaseView.id : LoginView.id));
  }
}
