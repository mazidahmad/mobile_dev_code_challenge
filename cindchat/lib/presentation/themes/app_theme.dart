import 'package:cindchat/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get darkTheme => ThemeData(
      primaryColorBrightness: Brightness.light,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: appColor.background,
      drawerTheme: DrawerThemeData(
        backgroundColor: appColor.background,
      ),
      primaryIconTheme: IconThemeData(color: appColor.onBackground),
      iconTheme: IconThemeData(color: appColor.onBackground),
      colorScheme: ColorScheme.dark(
          primary: appColor.pCyan,
          primaryVariant: appColor.pBlueSky,
          onPrimary: appColor.onPrimary,
          secondary: appColor.sDeepPurple,
          secondaryVariant: appColor.sGreenGrass,
          onSecondary: appColor.onSecondary,
          background: appColor.background,
          onBackground: kDTextColor,
          error: appColor.sRedishPink,
          onError: appColor.onError,
          onSurface: appColor.nStone,
          surface: appColor.nStone),
      backgroundColor: kSuperLightGrey,
      appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: appColor.onBackground)),
      bottomAppBarColor: kWhiteColor,
      errorColor: appColor.sRedishPink);
}
