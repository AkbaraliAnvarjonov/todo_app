import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/constants/app_colors.dart';

class TextStyles {
  static TextStyle large(
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
          fontFamily: "Rubik",
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: fontSize ?? 20.sp,
          color: color ?? AppColors.textColor);
  static TextStyle medium({Color? color, double? fontSize}) => TextStyle(
      fontFamily: "Rubik",
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 18.sp,
      color: color ?? AppColors.textColor);
  static TextStyle mediumBold(
          {Color? color, double? fontSize, FontWeight? fontWeight}) =>
      TextStyle(
          fontFamily: "Rubik",
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: fontSize ?? 11.sp,
          color: color ?? AppColors.textColor);
  static TextStyle small({Color? color, double? fontSize}) => TextStyle(
      fontFamily: "Rubik",
      fontWeight: FontWeight.w400,
      fontSize: fontSize ?? 11.sp,
      color: color ?? AppColors.textColor);
}
