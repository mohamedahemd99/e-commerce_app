import 'package:flutter/material.dart';

class AppCorners {
  static double sm = 3;
  static BorderRadius smBorder = BorderRadius.all(smRadius);
  static Radius smRadius = Radius.circular(sm);

  static double med = 5;
  static BorderRadius medBorder = BorderRadius.all(medRadius);
  static Radius medRadius = Radius.circular(med);

  static double lg = 10;
  static double xxlg = 30;
  static BorderRadius lgBorder = BorderRadius.all(
    lgRadius,
  );
  static BorderRadius xxlgBorder = BorderRadius.all(
    xxlgRadius,
  );
  static Radius lgRadius = Radius.circular(lg);
  static Radius xxlgRadius = Radius.circular(xxlg);

  static double xlg = 14;
  static BorderRadius xlgBorder = BorderRadius.all(xlgRadius);
  static Radius xlgRadius = Radius.circular(xlg);

  static double xl2g = 20;
  static BorderRadius xl2gBorder = BorderRadius.all(xl2gRadius);
  static Radius xl2gRadius = Radius.circular(xl2g);
}

class Fonts {
  static const String raleway = "Raleway";
  static const String fraunces = "Fraunces";
}

class AppTextStyles {
  static const TextStyle raleway = TextStyle(
      fontFamily: Fonts.raleway, fontWeight: FontWeight.w400, height: 1);
  static const TextStyle fraunces = TextStyle(
      fontFamily: Fonts.fraunces, fontWeight: FontWeight.w400, height: 1);

  static TextStyle get h1 => fraunces.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 34,
      letterSpacing: -1,
      height: 1.5);

  static TextStyle get h2 =>
      h1.copyWith(fontSize: 24, letterSpacing: -.5, height: 1.16);
  static TextStyle get h2_20 => h1.copyWith(
      fontSize: 20, letterSpacing: -.5, height: 1.16, color: Colors.white);
  static TextStyle get h2_18 =>
      h1.copyWith(fontSize: 18, letterSpacing: -.5, height: 1.16);

  static TextStyle get h3 =>
      h1.copyWith(fontSize: 14, letterSpacing: -.05, height: 1.29);

  static TextStyle get h4 =>
      h1.copyWith(fontSize: 13, letterSpacing: -.05, height: 1.29);

  static TextStyle get title1 =>
      raleway.copyWith(fontWeight: FontWeight.bold, fontSize: 16, height: 1.31);

  static TextStyle get title2 =>
      title1.copyWith(fontWeight: FontWeight.w500, fontSize: 14, height: 1.36);

  static TextStyle get body1 => raleway.copyWith(
      fontWeight: FontWeight.normal, fontSize: 14, height: 1.71);

  static TextStyle get body2 =>
      body1.copyWith(fontSize: 12, height: 1.5, letterSpacing: .2);

  static TextStyle get body3 =>
      body1.copyWith(fontSize: 12, height: 1.5, fontWeight: FontWeight.bold);
}
