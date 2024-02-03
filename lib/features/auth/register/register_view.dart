import 'package:ecommerce_app/core/components/buttons/text_button.dart';
import 'package:ecommerce_app/core/components/form_fields/app_password_input_field.dart';
import 'package:ecommerce_app/core/components/form_fields/app_validator.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/utils/navigation/navigator.dart';
import 'package:ecommerce_app/features/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/buttons/primary_elevated_button.dart';
import '../../../core/components/form_fields/app_input_text_field.dart';
import '../../../core/components/header_text.dart';
import '../../../core/utils/lang/generated/locale_keys.g.dart';
import '../bloc/auth_bloc.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  static const id = '/register';

  TextEditingController email = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Scaffold(
              backgroundColor: context.colors.primary,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        _buildTitle(context),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(AssetPaths.logoImage)),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            AppTextInputField(
                                validator: (value) {
                                  return AppValidator.validatorEmail(value!);
                                },
                                hintText: LocaleKeys.profile_email,
                                controller: email),
                            const SizedBox(
                              height: 20,
                            ),
                            AppTextInputField(
                                validator: (value) {
                                  return AppValidator.validatorRequired(value!);
                                },
                                hintText: LocaleKeys.profile_user_name,
                                controller: userName),
                            const SizedBox(
                              height: 20,
                            ),
                            AppTextInputField(
                                validator: (value) {
                                  return AppValidator.validatorRequired(value!);
                                },
                                hintText: LocaleKeys.profile_firstName,
                                controller: fName),
                            const SizedBox(
                              height: 20,
                            ),
                            AppTextInputField(
                                validator: (value) {
                                  return AppValidator.validatorRequired(value!);
                                },
                                hintText: LocaleKeys.profile_lastName,
                                controller: lName),
                            const SizedBox(
                              height: 20,
                            ),
                            AppPasswordInputField(
                              validator: (value) {
                                return AppValidator.validatorPassword(value!);
                              },
                              hintText: LocaleKeys.profile_password,
                              controller: pass,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            PrimaryElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthBloc>(context)
                                        .register({
                                      "username": userName.text,
                                      "password": pass.text,
                                      "email": email.text,
                                      "name": {
                                        "firstname": fName.text,
                                        "lastname": lName.text
                                      },
                                    }, context);
                                  }
                                },
                                localizationKey:
                                    LocaleKeys.common_buttons_register),
                            const SizedBox(
                              height: 40,
                            ),
                            PrimaryTextButton(
                                onPressed: () =>
                                    popAllAndPushName(context, LoginView.id),
                                localizationKey:
                                    LocaleKeys.common_buttons_have_account),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }

  HeaderText _buildTitle(BuildContext context) =>
      const HeaderText(translationKey: LocaleKeys.common_buttons_register);
}
