import 'package:ecommerce_app/core/components/form_fields/app_password_input_field.dart';
import 'package:ecommerce_app/core/components/form_fields/app_validator.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/features/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_app/features/auth/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/buttons/primary_elevated_button.dart';
import '../../../core/components/buttons/text_button.dart';
import '../../../core/components/form_fields/app_input_text_field.dart';
import '../../../core/components/header_text.dart';
import '../../../core/utils/lang/generated/locale_keys.g.dart';
import '../../../core/utils/navigation/navigator.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  static const id = '/login';
  final _formKey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

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
                          height: 100,
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
                                  return AppValidator.validatorRequired(value!);
                                },
                                hintText: LocaleKeys.profile_user_name,
                                controller: username),
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
                              height: 10,
                            ),
                            PrimaryElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthBloc>(context).login({
                                      "username": username.text,
                                      "password": pass.text
                                    }, context);
                                  }
                                },
                                localizationKey:
                                    LocaleKeys.common_buttons_login),
                            const SizedBox(
                              height: 10,
                            ),
                            PrimaryTextButton(
                                onPressed: () =>
                                    popAllAndPushName(context, RegisterView.id),
                                localizationKey:
                                    LocaleKeys.common_buttons_no_account),
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
      const HeaderText(translationKey: LocaleKeys.common_buttons_login);
}
