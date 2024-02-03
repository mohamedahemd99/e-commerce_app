import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_palette.dart';
import 'app_text_styles.dart';
import 'custom_colors.dart';

class AppTextInputField extends StatelessWidget {
  AppTextInputField({
    this.contentPadding,
    this.labelText,
    this.focusNode,
    this.autofocus = false,
    this.hintText,
    this.language,
    this.controller,
    this.enabled = true,
    this.obscureText = false,
    this.validator,
    this.prefix,
    this.maxLength,
    this.maxLines,
    this.onFieldSubmitted,
    this.minLines,
    this.style,
    this.decoration,
    this.borderRadius,
    this.suffix,
    this.fillColor,
    this.suffixIcon,
    this.border,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.readOnly = false,
    this.expands = false,
    this.keyboardType = TextInputType.text,
    this.borderColor = Colors.white,
  });

  final Color borderColor;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final bool expands;
  int? language;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  InputDecoration? decoration;
  final bool obscureText;
  final TextStyle? style;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final ValueChanged<String>? onChanged;
  final TextAlign? textAlign;
  final OutlineInputBorder? border;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return buildAppFormField(context);
  }

  Widget buildAppFormField(BuildContext context) {
    return AppFormField(
      autofocus: autofocus,
      readOnly: readOnly,
      expands: expands,
      style: style,
      obscureText: obscureText,
      enabled: enabled,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      decoration: decoration,
      hintText: hintText,
      suffix: suffix,
      suffixIcon: suffixIcon,
      prefix: prefix,
      textAlign: textAlign,
      controller: controller,
      focusNode: focusNode,
      contentPadding: contentPadding,
      border: border,
      maxLength: maxLength,
      fillColor: fillColor,
      onChanged: onChanged,
      borderColor: borderColor,
      borderRadius: borderRadius,
    );
  }
}

class AppFormField extends StatelessWidget {
  AppFormField({
    Key? key,
    this.autofocus = false,
    this.readOnly = false,
    this.expands = false,
    this.style,
    this.maxLength,
    this.obscureText = false,
    this.enabled = true,
    this.validator,
    this.onFieldSubmitted,
    this.maxLines,
    this.borderRadius,
    this.textAlign,
    this.minLines,
    this.keyboardType,
    this.decoration,
    this.hintText,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.controller,
    this.focusNode,
    this.borderColor,
    this.onChanged,
    this.contentPadding,
    this.border,
    this.fillColor,
    this.textAlignVertical,
  }) : super(key: key);
  final bool autofocus;
  final bool readOnly;
  final bool expands;
  final TextStyle? style;
  final bool obscureText;
  final bool enabled;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;
  final TextAlignVertical? textAlignVertical;
  final ValueChanged<String>? onChanged;

  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;

  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final String? hintText;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final double? borderRadius;
  final int? maxLength;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final OutlineInputBorder? border;
  final OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: CustomColors.greyAppColor, width: 2),
    borderRadius: AppCorners.medBorder,
  );
  final OutlineInputBorder inputFocusedBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: CustomColors.greyAppColor, width: 2),
    borderRadius: AppCorners.medBorder,
  );
  final OutlineInputBorder inputErrorBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppPalette.errorColor,
    ),
    borderRadius: AppCorners.medBorder,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
      autofocus: autofocus,
      readOnly: readOnly,
      expands: expands,
      style: style,
      obscureText: obscureText,
      enabled: enabled,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      textAlign: textAlign!,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: decoration ??
          InputDecoration(
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: inputBorder,
            focusedBorder: inputBorder,
            enabledBorder: inputBorder,
            errorBorder: inputErrorBorder,
            disabledBorder: inputBorder,
            hintText: hintText!.tr(),
            hintStyle:
                AppTextStyles.h3.copyWith(color: CustomColors.greyAppColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffix: suffix,
            // prefix: prefix,
            errorMaxLines: 2,
            suffixIcon: suffixIcon,
            prefixIcon: prefix,
            alignLabelWithHint: true,
            fillColor: fillColor,
            filled: fillColor != null ? true : false,
          ),
      onChanged: onChanged,
      controller: controller,
      focusNode: focusNode,
    );
  }
}
