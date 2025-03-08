import 'package:flutter/material.dart';

class FontHelper {
  static TextStyle fontText(
      double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'cairo',
    );
  }
}
