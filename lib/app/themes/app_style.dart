import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle _baseStyle(FontWeight fontWeight, double fontSize,
          [Color? color]) =>
      TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      );

  static TextStyle w400(double size, [Color? color]) =>
      _baseStyle(FontWeight.w400, size, color);

  static TextStyle w500(double size, [Color? color]) =>
      _baseStyle(FontWeight.w500, size, color);

  static TextStyle w600(double size, [Color? color]) =>
      _baseStyle(FontWeight.w600, size, color);

  static TextStyle w700(double size, [Color? color]) =>
      _baseStyle(FontWeight.w700, size, color);

  static TextStyle w800(double size, [Color? color]) =>
      _baseStyle(FontWeight.w800, size, color);

  static TextStyle w900(double size, [Color? color]) =>
      _baseStyle(FontWeight.w900, size, color);
}
