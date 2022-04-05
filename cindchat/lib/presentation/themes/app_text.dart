import 'package:cindchat/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';

class AppText {
  static TextStyle get heading5 => TextStyle(
      fontWeight: FontWeight.w500, fontSize: 15, color: appColor.textColor);
  static TextStyle get subheading => TextStyle(
      fontWeight: FontWeight.w400, fontSize: 13, color: appColor.textColor);
  static TextStyle get footnote => TextStyle(
      fontWeight: FontWeight.w400, fontSize: 12, color: appColor.textColor);
}
