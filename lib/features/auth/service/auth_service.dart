import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/constants/enums/request_types.dart';
import 'package:ecommerce_app/core/utils/network/network_manager.dart';
import 'package:ecommerce_app/features/profile/model/profile_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/utils/navigation/navigator.dart';
import '../../../core/utils/preferences/pref_manager.dart';
import '../login/login_view.dart';
import '../model/login_model.dart';

class AuthService {
  final NetworkManager? _networkManager = NetworkManager.instance;

  Future<UsersLoginModel?> login(
      {Map<String, dynamic>? data, required BuildContext context}) async {
    await _networkManager!
        .request(
            method: ReqTypes.post,
            path: ApiConstants.login,
            model: UsersLoginModel(),
            data: data)
        .then((value) {
      PrefManager.setToken(value!.token!);

      popAllAndPushName(context, BaseView.id);

      return value as UsersLoginModel;
    });
  }

  Future<ProfileModel?> register(
      {Map<String, dynamic>? data, required BuildContext context}) async {
    await _networkManager!
        .request(
            method: ReqTypes.post,
            path: ApiConstants.register,
            model: ProfileModel(),
            data: data)
        .then((value) {
      debugPrint(value!.id!);
      popAllAndPushName(context, LoginView.id);

      return value as ProfileModel;
    });
  }
}
