import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/extensions/context_extension.dart';
import 'package:ecommerce_app/core/extensions/string_case_extension.dart';
import 'package:ecommerce_app/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app/features/shop/cubit/shop_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ShopAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight * 1),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  ShopAppBarState createState() => ShopAppBarState();
}

class ShopAppBarState extends State<ShopAppBar> {
  @override
  Widget build(BuildContext context) {
    return _buildHeader(context);
  }

  AppBar _buildHeader(BuildContext context) {
    return AppBar(
      backgroundColor: context.colors.secondary,
      elevation: 5,
      iconTheme: IconThemeData(color: context.colors.onPrimary),
      titleTextStyle: context.textTheme.headlineSmall!
          .copyWith(color: context.colors.onPrimary),
      title: Center(
        child: Text(
          LocaleKeys.shop_title.tr().toTitleCase(),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () => context.read<ShopCubit>().changeView(),
            icon: BlocBuilder<ShopCubit, ShopState>(
              builder: (context, state) {
                return Icon(
                  state.isGrid ? Icons.list : Icons.grid_view_rounded,
                );
              },
            ))
      ],
    );
  }
}
