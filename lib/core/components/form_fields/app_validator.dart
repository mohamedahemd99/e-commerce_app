import 'package:easy_localization/easy_localization.dart';

import '../../utils/lang/generated/locale_keys.g.dart';

class AppValidator {
  static String? validatorRequired(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.common_messages_enter_data.tr();
    }
    return null;
  }

  static String? validatorEmail(String value) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return LocaleKeys.common_messages_enter_valid_email.tr();
    }
    return null;
  }

  static String? validatorPhoneNumber(String value) {
    const String pattern =
        r'\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{5,14}$';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return LocaleKeys.common_messages_enter_data.tr();
    }
    return null;
  }

  static String? validatorPassword(String value) {
    const String pattern =
        r'^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{7,20})';
    final RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return LocaleKeys.common_messages_enter_valid_password.tr();
    }
    return null;
  }
}
