import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/components/buttons/primary_elevated_button.dart';
import 'package:ecommerce_app/core/components/buttons/primary_expansion_tile.dart';
import 'package:ecommerce_app/core/components/form_fields/app_input_text_field.dart';
import 'package:ecommerce_app/core/components/header_text.dart';
import 'package:ecommerce_app/core/constants/asset_paths.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/core/utils/theme/cubit/theme_cubit.dart';
import 'package:ecommerce_app/features/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/buttons/text_button.dart';
import '../../auth/bloc/auth_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController email = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(const ProfileInitialized()),
      child: Scaffold(
        backgroundColor: context.colors.primary,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTitle(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileTile(context),
                      ..._buildTiles(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  HeaderText _buildTitle(BuildContext context) =>
      const HeaderText(translationKey: LocaleKeys.profile_title);

  BlocBuilder _buildProfileTile(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoad) {
          if (state.profileModel != null) {
            email.text = state.profileModel!.email!;
            fName.text = state.profileModel!.name!.firstname!;
            lName.text = state.profileModel!.name!.lastname!;
            userName.text = state.profileModel!.username!;
          }

          return SizedBox(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: context.colors.onPrimary,
                backgroundImage: const AssetImage(AssetPaths.profileImage),
                radius: 30,
              ),
              title: Text(
                '${state.profileModel!.name!.firstname.toString().toTitleCase()} ${state.profileModel!.name!.lastname.toString().toTitleCase()}',
                // LocaleKeys.common_placeholder_name.tr().toTitleCase(),
                style: context.textTheme.titleLarge!
                    .copyWith(color: context.colors.onBackground),
              ),
              subtitle: Text(
                state.profileModel!.email!,
                style: context.textTheme.bodySmall!
                    .copyWith(color: context.colors.onBackground),
              ),
            ),
          );
        }
        if (state is ProfileError) {
          return const Text('ERROR');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  List<Widget> _buildTiles(BuildContext context) {
    return [
      _buildEditProfile(),
      PrimaryExpansionTile(
        LocaleKeys.profile_settings,
        widgets: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.profile_theme.tr().toTitleCase(),
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: context.colors.onBackground),
                  ),
                  _buildThemeButton(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.logout),
                  PrimaryTextButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).logout(context);
                    },
                    localizationKey: 'logout',
                  ),
                ],
              ),
            ],
          ),
        ],
      )
    ];
  }

  BlocBuilder _buildEditProfile() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoad) {
          return PrimaryExpansionTile(
            LocaleKeys.common_buttons_edit_profile,
            widgets: [
              Padding(
                padding: context.paddingLow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextInputField(
                            hintText: LocaleKeys.profile_email,
                            controller: email,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextInputField(
                              hintText: LocaleKeys.profile_firstName,
                              controller: fName),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextInputField(
                            hintText: LocaleKeys.profile_lastName,
                            controller: lName,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppTextInputField(
                            hintText: LocaleKeys.profile_user_name,
                            controller: userName,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          PrimaryElevatedButton(
                              onPressed: () {
                                BlocProvider.of<ProfileBloc>(context)
                                    .updateProfile({
                                  "email": email.text,
                                  "username": userName.text,
                                  "name": {
                                    "firstname": fName.text,
                                    "lastname": lName.text
                                  },
                                });
                              },
                              localizationKey:
                                  LocaleKeys.common_buttons_edit_profile)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          );
        } else if (state is ProfileError) {
          return const Text('Error');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  BlocBuilder<ThemeCubit, ThemeState> _buildThemeButton() {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.isDark,
          onChanged: (newValue) {
            context.read<ThemeCubit>().toggleSwitch(newValue);
          },
        );
      },
    );
  }
}
