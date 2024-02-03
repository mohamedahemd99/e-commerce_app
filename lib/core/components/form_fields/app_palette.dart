import 'package:flutter/material.dart';

enum PaletteType { light, dark }

class PaletteModel {
  const PaletteModel({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.text,
    required this.textDark,
    required this.textMedium,
    required this.textLight,
    required this.textWhite,
    required this.textDisabled,
    required this.surface,
    required this.background,
    required this.border,
    required this.borderLight,
    required this.borderLighter,
    required this.notificationUnread,
    required this.error,
    required this.skeleton,
    required this.success,
  });
  final Color? primary;
  final Color? secondary;
  final Color? surface;
  final Color? background;
  final Color? accent;
  final Color? text;
  final Color? textDark;
  final Color? textMedium;
  final Color? textLight;
  final Color? textWhite;
  final Color? textDisabled;
  final Color? border;
  final Color? borderLight;
  final Color? borderLighter;
  final Color? notificationUnread;
  final Color? error;
  final Color? skeleton;
  final Color? success;
}

class AppPalette {
  static const MaterialColor kUnfoundedColor = Colors.red;
  static PaletteType paletteType = PaletteType.light;

  static const PaletteModel _lightPalette = PaletteModel(
    primary: Color(0xFF1E2074),
    secondary: Color(0xFF1C1D6B),
    accent: Color(0x544475DF),
    text: Color(0xFF92929D),
    textDark: Color(0xFF222222),
    textMedium: Color(0xFF98a3af),
    textLight: Color(0xFF6b7893),
    textWhite: Color(0xFFFFFFFF),
    textDisabled: Color(0xffe1e4e9),
    border: Color(0xffDDDDDD),
    borderLight: Color(0xFFFAFAFB),
    borderLighter: Color(0xFB989898),
    surface: Color(0xFFFFFFFF),
    background: Color(0xFFeff3fb),
    notificationUnread: Color(0x11EE4340),
    error: Color(0xFFFF0400),
    skeleton: Color(0xFFF1F1F1),
    success: Color(0xFF16CA05),
  );

  static Map<PaletteType, PaletteModel> _palette = {
    PaletteType.light: _lightPalette,
  };

  static Color get primaryColor {
    return _palette[AppPalette.paletteType]?.primary ?? kUnfoundedColor;
  }

  static Color get secondaryColor {
    return _palette[AppPalette.paletteType]?.secondary ?? kUnfoundedColor;
  }

  static Color get accentColor {
    return _palette[AppPalette.paletteType]?.accent ?? kUnfoundedColor;
  }

  static Color get textColor {
    return _palette[AppPalette.paletteType]?.text ?? kUnfoundedColor;
  }

  static Color get textDarkColor {
    return _palette[AppPalette.paletteType]?.textDark ?? kUnfoundedColor;
  }

  static Color get textMediumColor {
    return _palette[AppPalette.paletteType]?.textMedium ?? kUnfoundedColor;
  }

  static Color get textLightColor {
    return _palette[AppPalette.paletteType]?.textLight ?? kUnfoundedColor;
  }

  static Color get textWhiteColor {
    return _palette[AppPalette.paletteType]?.textWhite ?? kUnfoundedColor;
  }

  static Color get textDisabledColor {
    return _palette[AppPalette.paletteType]?.textDisabled ?? kUnfoundedColor;
  }

  static Color get borderColor {
    return _palette[AppPalette.paletteType]?.border ?? kUnfoundedColor;
  }

  static Color get borderLightColor {
    return _palette[AppPalette.paletteType]?.borderLight ?? kUnfoundedColor;
  }

  static Color get borderLighterColor {
    return _palette[AppPalette.paletteType]?.borderLighter ?? kUnfoundedColor;
  }

  static Color get surfaceColor {
    return _palette[AppPalette.paletteType]?.surface ?? kUnfoundedColor;
  }

  static Color get backgroundColor {
    return _palette[AppPalette.paletteType]?.background ?? kUnfoundedColor;
  }

  static Color get notificationUnreadColor {
    return _palette[AppPalette.paletteType]?.notificationUnread ?? kUnfoundedColor;
  }

  static Color get errorColor {
    return _palette[AppPalette.paletteType]?.error ?? kUnfoundedColor;
  }

  static Color get skeletonColor {
    return _palette[AppPalette.paletteType]?.skeleton ?? kUnfoundedColor;
  }

  static Color get successColor {
    return _palette[AppPalette.paletteType]?.success ?? kUnfoundedColor;
  }
}
