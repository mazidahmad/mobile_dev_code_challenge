import 'package:flutter/material.dart';

// colors palette

// dark

// neutral
const Color kDBackgroundColor = Color(0xff222733);
const Color kDBackgroundMenuColor = Color(0xff2A303F);
const Color kDTextColor = Color(0xffF4F9FF);
const Color kDStatusBarColor = Color(0xffFFFFFF);
const Color kDLightGreyOnDarkColor = Color(0xffF4F9FF);
const Color kDLightGreyColor = Color(0xffE7EFF7);
const Color kDCementOnDarkColor = Color(0xff78899B);
const Color kDCementColor = Color(0xff6C7F94);
const Color kDStoneOnDarkColor = Color(0xff19202D);
const Color kDStoneColor = Color(0xff121723);

// primary
const MaterialColor kDBlueSkyColor =
    MaterialColor(_darkBlueSkyPrimaryValue, <int, Color>{
  50: Color(0xff2A4762),
  100: Color(0xff2A577A),
  200: Color(0xff2A6792),
  300: Color(0xff2A77AA),
  400: Color(0xff3985B6),
  500: Color(_darkBlueSkyPrimaryValue),
});

const int _darkBlueSkyPrimaryValue = 0xff2A89C5;

const MaterialColor kDCyanColor =
    MaterialColor(_darkCyanPrimaryValue, <int, Color>{
  50: Color(0xff2A515D),
  100: Color(0xff2A6873),
  200: Color(0xff2A7D88),
  300: Color(0xff2A939D),
  400: Color(0xff39A1AA),
  500: Color(_darkCyanPrimaryValue),
});

const int _darkCyanPrimaryValue = 0xff2AADB6;

// secondary
const MaterialColor kDDeepPurpleColor =
    MaterialColor(_darkDeepPurpleSecondaryValue, <int, Color>{
  50: Color(0xff3E4059),
  100: Color(0xff4D4B6C),
  200: Color(0xff5C577E),
  300: Color(0xff6A618F),
  400: Color(0xff78709C),
  500: Color(_darkDeepPurpleSecondaryValue),
});

const int _darkDeepPurpleSecondaryValue = 0xff7B6EA4;

const MaterialColor kDGreenGrassColor =
    MaterialColor(_darkGreenGrassSecondaryValue, <int, Color>{
  50: Color(0xff435251),
  100: Color(0xff546A5E),
  200: Color(0xff66816B),
  300: Color(0xff769877),
  400: Color(0xff85A585),
  500: Color(_darkGreenGrassSecondaryValue),
});

const int _darkGreenGrassSecondaryValue = 0xff8AB386;

const MaterialColor kDSunsetColor =
    MaterialColor(_darkSunsetSecondaryValue, <int, Color>{
  50: Color(0xff564E47),
  100: Color(0xff75624C),
  200: Color(0xff937651),
  300: Color(0xffB08B57),
  400: Color(0xffBE9864),
  500: Color(_darkSunsetSecondaryValue),
});

const int _darkSunsetSecondaryValue = 0xffD3A25D;

const MaterialColor kDOrangeColor =
    MaterialColor(_darkOrangeSecondaryValue, <int, Color>{
  50: Color(0xff543F3F),
  100: Color(0xff714A3F),
  200: Color(0xff8D543F),
  300: Color(0xffA95F3F),
  400: Color(0xffB86C4C),
  500: Color(_darkOrangeSecondaryValue),
});

const int _darkOrangeSecondaryValue = 0xffCB6B3F;

const MaterialColor kDPinkReddishColor =
    MaterialColor(_darkPinkReddishSecondaryValue, <int, Color>{
  50: Color(0xff52384E),
  100: Color(0xff6E3F5A),
  200: Color(0xff894564),
  300: Color(0xffA44B6F),
  400: Color(0xffB35A7C),
  500: Color(_darkPinkReddishSecondaryValue),
});

const int _darkPinkReddishSecondaryValue = 0xffC5527C;

const MaterialColor kDPinkCoolColor =
    MaterialColor(_darkPinkCoolSecondaryValue, <int, Color>{
  50: Color(0xff563E58),
  100: Color(0xff754969),
  200: Color(0xff93527A),
  300: Color(0xffB05C8B),
  400: Color(0xffBE6B98),
  500: Color(_darkPinkCoolSecondaryValue),
});

const int _darkPinkCoolSecondaryValue = 0xffD368A0;

// comment

const Color kPrimaryColor = Color(0xff00c2c5);
const Color kSecondaryColor = Color(0xff01a6ff);
// const Color kOrangeColor = Color(0xfffca311);
const Color kOrangeVividColor = Color(0xfff15b00);
const Color kPurpleColor = Color(0xff5C40CC);
const Color kPurpleDarkColor = Color(0xff1F1449);
const Color kBlackColor = Color(0xff000000);
const Color kBlackSoftColor = Color(0xff06080A);
const Color kSuperLightGrey = Color(0xFFF4F9FF);
const Color kDSuperLightGrey = Color(0xFF222733);
const Color kWhiteColor = Color(0xffFFFFFF);
const Color kWhiteAccentColor = Color(0xffD3D3D3);
const Color kWhiteCalmColor = Color(0xffFFFFFC);
const Color kBackgroundColor = Color(0xffe5e5e5);
const Color kGreyColor = Color(0xffF8F9FD);
const Color kGreySlateColor = Color(0xff758a9a);
const Color kGreyLightColor = Color(0xffF6F6F6);
const Color kGreyDarkColor = Color(0xff696969);
const Color kRedColor = Color(0xffDB3447);
const Color kYellowColor = Color(0xffFEBF32);
const Color kTurquoiseColor = Color(0xff34ccd4);
const Color kGreenColor = Color(0xff2FA64D);
const Color kGreenDarkColor = Color(0xff264653);
const Color kGreenCalmColor = Color(0xff2a9d8f);
const Color kGreenStabiloColor = Color(0xff4acf14);
const Color kBlueColor = Color(0xff0280FA);
const Color kBlueAliceColor = Color(0xfff4f9ff);
const Color kBlueSkyColord = Color(0xffA2D2FF);
const Color kBlueBabyColor = Color(0xffBDE0FE);
const Color kBlueDarkColor = Color(0xff14213d);
const Color kBlueFacebookColor = Color(0xff3B5998);
const Color kPinkColor = Color(0xffFFAFCC);
const Color kGoldColor = Color(0xffFFD700);
const Color kTransparentColor = Color(0xffff0f1f4);
const BoxShadow kShadowLightBlackColor = BoxShadow(
  color: Color.fromRGBO(0, 0, 0, 0.1),
  offset: Offset(0, 2),
  spreadRadius: 2,
  blurRadius: 2,
);
const BoxShadow kPrimaryShadowColor = BoxShadow(
  color: Color.fromRGBO(0, 0, 194, 197),
  offset: Offset(0, 2),
  spreadRadius: 2,
  blurRadius: 2,
);

class AppColor {
  static final AppColor _instance = AppColor._internal();

  AppColor._internal();

  Color nCement = kDCementColor;
  Color nCementOnLight = kDCementOnDarkColor;
  Color nStone = kDStoneColor;
  Color nStoneOnLight = kDStoneOnDarkColor;
  MaterialColor pBlueSky = kDBlueSkyColor;
  MaterialColor pCyan = kDCyanColor;
  MaterialColor sDeepPurple = kDDeepPurpleColor;
  MaterialColor sGreenGrass = kDGreenGrassColor;
  MaterialColor sSunset = kDSunsetColor;
  MaterialColor sOrange = kDOrangeColor;
  MaterialColor sRedishPink = kDPinkReddishColor;
  MaterialColor sCoolPink = kDPinkCoolColor;
  Color textColor = kDTextColor;
  Color textScan = kDBackgroundColor;
  Color primary = kDCyanColor;
  Color primaryVariant = kDBlueSkyColor;
  Color onPrimary = kWhiteColor;
  Color secondary = kDDeepPurpleColor;
  Color secondaryVariant = kDGreenGrassColor;
  Color onSecondary = kWhiteColor;
  Color background = kDBackgroundColor;
  Color backgroundMenu = kDBackgroundMenuColor;
  Color onBackground = kDTextColor;
  Color onBackgroundMenu = kDBackgroundMenuColor;
  Color error = kDPinkReddishColor;
  Color onError = kWhiteColor;
  Color onSurface = kDTextColor;
  Color surface = kDStoneColor;
  Color superLightGrey = kSuperLightGrey;

  factory AppColor() {
    return _instance;
  }
}

final appColor = AppColor();
