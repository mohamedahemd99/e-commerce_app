import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PrimaryTextButton extends StatelessWidget {
  const PrimaryTextButton({
    super.key,
    required this.onPressed,
    required this.localizationKey,
  });

  final VoidCallback onPressed;
  final String localizationKey;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          localizationKey.tr().toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.red),
        ));
  }
}
