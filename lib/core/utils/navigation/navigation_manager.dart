import 'package:ecommerce_app/core/base/view/base_view.dart';
import 'package:flutter/cupertino.dart';

import '../../../features/auth/login/login_view.dart';
import '../../../features/auth/register/register_view.dart';
import '../../../features/splash/splash_view.dart';

class NavigationManager {
  static final routes = <String, Widget Function(BuildContext)>{
    SplashView.id: (context) => const SplashView(),
    BaseView.id: (context) => const BaseView(),
    LoginView.id: (context) => LoginView(),
    RegisterView.id: (context) => RegisterView(),
  };
}
