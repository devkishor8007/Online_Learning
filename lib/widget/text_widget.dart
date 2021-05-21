import 'package:flutter/material.dart';

Widget text(String text,
    {Color textColor, double size, FontWeight fontWeight}) {
  return Text(
    text,
    style: TextStyle(color: textColor, fontSize: size, fontWeight: fontWeight),
  );
}
