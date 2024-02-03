import 'package:flutter/material.dart';

void pushView(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
  );
}

void popALlAndPushPage(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
    (Route<dynamic> route) => false,
  );
}

void popAllAndPushName(
  BuildContext context,
  String widget, {
  RoutePredicate? condition,
  Object? arguments,
}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
      widget, condition ?? (Route<dynamic> route) => false,
      arguments: arguments);
}

Future<dynamic> pushName(BuildContext context, String route,
    {dynamic arguments}) {
  return Navigator.of(context).pushNamed(route, arguments: arguments);
}

Future<dynamic> pushNameForResult(BuildContext context, String route) {
  return Navigator.of(context).pushNamed(route);
}

Future<dynamic> pushNameWithArgumentsForResult(
    BuildContext context, String route, dynamic argument) {
  return Navigator.of(context).pushNamed(route, arguments: argument);
}

void pushNameWithArguments(
    BuildContext context, String route, dynamic argument) {
  Navigator.of(context).pushNamed(route, arguments: argument);
}

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
  FocusScope.of(context).requestFocus(FocusNode());
}

void pushNameReplacement(BuildContext context, String route,
    {dynamic arguments}) {
  Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
}

void pushPageRoute<T>(BuildContext context, Route<T> route) {
  Navigator.of(context).push(route);
}
