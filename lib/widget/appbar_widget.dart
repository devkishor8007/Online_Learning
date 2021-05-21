import 'package:flutter/material.dart';

Widget appBar(
    {double elevation,
    Widget title,
    Widget leading,
    List<Widget> actions,
    Color backgroundColor}) {
  return AppBar(
    title: title,
    leading: leading,
    actions: actions,
    elevation: elevation,
    backgroundColor: backgroundColor,
  );
}
