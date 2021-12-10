import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_constants.dart';

class ThemeConfig {
  static ThemeData createTheme() {
    return ThemeData(
        fontFamily: 'DMSans',
        textTheme: TextTheme(
          //login
          headline1: TextStyle(
              fontSize: 36.sp,
              fontWeight: FontWeight.normal,
              color: ColorConstants.white),
          headline2: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.normal,
              color: ColorConstants.white),
          //profil
          headline3: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: ColorConstants.grayDark),
          //chat
          headline4: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
              color: ColorConstants.gray),
          //chat list
          headline5: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
              color: ColorConstants.white),
          subtitle1: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.normal,
              color: ColorConstants.white),
          //textinput, text
          bodyText1: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
              color: ColorConstants.grayDark),
          //label
          caption: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: ColorConstants.gray),
          button: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ColorConstants.white),
          //error
          bodyText2: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: ColorConstants.primary),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: ColorConstants.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          behavior: SnackBarBehavior.floating,
        ));
  }
}
