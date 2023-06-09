import 'package:flutter/material.dart';

const String family = "Lexend";

double dvHeight(BuildContext context) => MediaQuery.of(context).size.height;

double dvWidth(BuildContext context) => MediaQuery.of(context).size.width;

SizedBox vpad(double size) => SizedBox(height: size);

SizedBox hpad(double size) => SizedBox(width: size);

double bottomSafePad(BuildContext context) =>
    MediaQuery.of(context).padding.bottom;

double topSafePad(BuildContext context) => MediaQuery.of(context).padding.top;

double appbarHeight(BuildContext context) => AppBar().preferredSize.height;

// const Color backgroundColor = Color(0xffF5F7FC);
const Color backgroundColor = Color(0xffF8FAFE);

const Color shadowColor = Color(0xff6575A7);
const Color primaryColorBase = Color(0xff466FFF);
const Color primaryColor1 = Color(0xff3462FF);
const Color primaryColor2 = Color(0xff5F8BFF);
const Color primaryColor3 = Color(0xff789CFF);
const Color primaryColor4 = Color(0xffB1C7FF);
const Color primaryColor5 = Color(0xffECF1FF);

const Color secondaryColor6 = Color(0xff2CA9BC);
const Color secondaryColorBase = Color(0xff00C3B8);
const Color secondaryColor1 = Color(0xff02AACF);
const Color secondaryColor2 = Color(0xff15CAF2);
const Color secondaryColor3 = Color(0xff31D6FA);
const Color secondaryColor4 = Color(0xff72E6FF);
const Color secondaryColor5 = Color(0xffCDF6FF);
const Color secondaryColor7 = Color(0xff2CA9BC);
const Color secondaryColor8 = Color(0xff82B3FD);
const Color secondaryColor9 = Color(0xff4090BD);
const Color secondaryColor10 = Color(0xffE8EEFB);
Color secondaryColor11 = Color(0xff107281).withOpacity(0.83);

const Color grayScaleColorBase = Color(0xff4E4B66);
const Color grayScaleColor1 = Color(0xff14142B);
const Color grayScaleColor2 = Color(0xff6E7191);
const Color grayScaleColor3 = Color(0xffA0A3BD);
const Color grayScaleColor4 = Color(0xffD0D3E5);
const Color grayScaleColor5 = Color(0xffEFF0F7);
const Color grayScaleColor6 = Color(0xff898A8D);
const Color grayScaleColor7 = Color(0xffD9D9D9);
const Color grayScaleColor8 = Color(0xffDFE0EB);

const Color yellowColorBase = Color(0xffFFBF35);
const Color yellowColor1 = Color(0xffFFA900);
const Color yellowColor2 = Color(0xffFFCE5B);
const Color yellowColor3 = Color(0xffFFDE70);
const Color yellowColor4 = Color(0xffFFEEB7);
const Color yellowColor5 = Color(0xffFFF6DA);

const Color yellowColor6 = Color(0xffFFC700);
const Color yellowColor7 = Color(0xffFF9900);

const Color purpleColorBase = Color(0xff6C4DDA);
const Color purpleColor1 = Color(0xff522ED2);
const Color purpleColor2 = Color(0xff8268DF);
const Color purpleColor3 = Color(0xff977DF3);
const Color purpleColor4 = Color(0xffBDABFB);
const Color purpleColor5 = Color(0xffE7E0FF);
const Color purpleColor6 = Color(0xff8A04C9);
const Color purpleColor7 = Color(0xff5D5FEF);

const Color redColorBase = Color(0xffFF4141);
const Color redColor1 = Color(0xffEB2323);
const Color redColor2 = Color(0xffFF6868);
const Color redColor3 = Color(0xffFF9898);
const Color redColor4 = Color(0xffFFC6C6);
const Color redColor5 = Color(0xffFFE2E2);

const Color redColor6 = Color(0xffFF0000);
const Color redColor7 = Color(0xffFF9D9D);
const Color redColor8 = Color(0xffDDD3D3);

const Color greenColorBase = Color(0xff23D2C3);
const Color greenColor1 = Color(0xff01BCAD);
const Color greenColor2 = Color(0xff42E1D4);
const Color greenColor3 = Color(0xff76ECE2);
const Color greenColor4 = Color(0xff9FF2EB);
const Color greenColor5 = Color(0xffDAF5F3);

const Color greenColor6 = Color(0xff00C950);

const Color pinkColorBase = Color(0xffFF4E98);
const Color pinkColor1 = Color(0xffFF227F);
const Color pinkColor2 = Color(0xffFF66A6);
const Color pinkColor3 = Color(0xffFF91BF);
const Color pinkColor4 = Color(0xffFFC5DD);
const Color pinkColor5 = Color(0xffFFE9F2);

const gradientBackground = LinearGradient(
    colors: [Color(0xffFFFFFF), Color(0xffF6F5FF), Color(0xffDEE5FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

final gradientPrimary = LinearGradient(colors: [
  const Color(0xff4A54FF).withOpacity(1),
  const Color(0xff0066FF).withOpacity(0.8)
], begin: Alignment.centerLeft, end: Alignment.centerRight);

const Color blueColor = Color(0xff466FFF);
const Color blueColor2 = Color(0xff4975FF);
const Color turquoiseColor = Color(0xff00BCE5);
const Color greenColor = Color(0xff23D2C3);
const Color pinkColor = Color(0xffFF4E98);
const Color yellowColor = Color(0xffFFBF35);
const Color purpleColor = Color(0xff6C4DDA);
const Color redColor = Color(0xffFF4141);

final gradientBlue = LinearGradient(
    colors: [const Color(0xff466FFF).withOpacity(0.6), const Color(0xff3462FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

final gradientTurquoise = LinearGradient(
    colors: [const Color(0xff00BCE5).withOpacity(0.6), const Color(0xff02AACF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

final gradientGreen = LinearGradient(
    colors: [const Color(0xff23D2C3).withOpacity(0.6), const Color(0xff01BCAD)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
final gradientBlueButton = LinearGradient(colors: [
  const Color(0xff44D5EB),
  const Color(0xff2CA9BC).withOpacity(0.83)
], begin: Alignment.centerLeft, end: Alignment.centerRight);
final gradientBlueBackground = LinearGradient(
    colors: [const Color(0xffE8EEFB), const Color(0xffE8EEFB)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

final gradientPink = LinearGradient(
    colors: [const Color(0xffFF4E98).withOpacity(0.6), const Color(0xffFF227F)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

final gradientYellow = LinearGradient(
    colors: [const Color(0xffFFBF35).withOpacity(0.6), const Color(0xffFFA900)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

final gradientPurple = LinearGradient(
    colors: [const Color(0xff6C4DDA).withOpacity(0.6), const Color(0xff522ED2)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

final gradientRed = LinearGradient(
    colors: [const Color(0xffFF4141).withOpacity(0.6), const Color(0xffEB2323)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);

final gradientWhite = LinearGradient(colors: [
  const Color(0xffFFFFFF).withOpacity(0.9),
  const Color(0xffFFFFFF).withOpacity(0.7)
], begin: Alignment.topLeft, end: Alignment.bottomRight);
final gradientBlack = LinearGradient(colors: [
  const Color(0xff4E4B66).withOpacity(0.9),
  const Color(0xffA0A3BD).withOpacity(0.9)
], begin: Alignment.topLeft, end: Alignment.bottomRight);
final gradientYeallow = LinearGradient(colors: [
  const Color(0xffFFA900).withOpacity(0.9),
  const Color(0xffFFBE34).withOpacity(0.9),
], begin: Alignment.topLeft, end: Alignment.bottomRight);

TextStyle txtDisplayLarge({Color? color}) => TextStyle(
      fontFamily: family,
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: color,
    );

TextStyle txtDisplayMedium({Color? color}) => TextStyle(
    fontFamily: family,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: color);

TextStyle txtDisplaySmall({Color? color}) => TextStyle(
    fontFamily: family,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: color);

TextStyle txtDisplayXSmall({Color? color}) => TextStyle(
    fontFamily: family,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: color);

TextStyle txtLinkLarge({Color? color}) => TextStyle(
    fontFamily: family,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color);

TextStyle txtLinkMedium({Color? color}) => TextStyle(
    fontFamily: family,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color);

TextStyle txtLinkXMedium({Color? color}) => TextStyle(
    fontFamily: family,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: color);

TextStyle txtLinkSmall({Color? color}) => TextStyle(
      fontFamily: family,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
    );

TextStyle txtLinkXSmall({Color? color}) => TextStyle(
    fontFamily: family,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: color);

TextStyle txtLinkXXSmall({Color? color}) => TextStyle(
    fontFamily: family,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: color);

TextStyle txtBodyLargeRegular({Color? color}) =>
    TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: color);

TextStyle txtBodyMediumRegular({Color? color}) =>
    TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: color);

TextStyle txtBodyXMediumRegular({Color? color}) =>
    TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: color);

TextStyle txtBodySmallRegular({Color? color}) =>
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color);

TextStyle txtBodyXSmallRegular({Color? color}) =>
    TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: color);

TextStyle txtBodyLargeBold({Color? color}) =>
    TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: color);

TextStyle txtBodyMediumBold({Color? color}) =>
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color);

TextStyle txtBodySmallBold({Color? color}) =>
    TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: color);

TextStyle txtBodyXSmallBold({Color? color}) =>
    TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: color);

TextStyle txtBodyXXSmallBold({Color? color}) =>
    TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color);

TextStyle txtBold([double? size, Color? color, double? opacity]) => TextStyle(
    fontFamily: family,
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: opacity != null ? color!.withOpacity(opacity) : color);

TextStyle txtSemiBold([double? size, Color? color, double? opacity]) =>
    TextStyle(
        fontFamily: family,
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: opacity != null ? color!.withOpacity(opacity) : color);

TextStyle txtMedium([double? size, Color? color, double? opacity]) => TextStyle(
    fontFamily: family,
    fontSize: size,
    fontWeight: FontWeight.w500,
    color: opacity != null ? color!.withOpacity(opacity) : color);

TextStyle txtRegular([double? size, Color? color, double? opacity]) =>
    TextStyle(
        fontFamily: family,
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: opacity != null ? color!.withOpacity(opacity) : color);

class AppImage {
  static const String qltnLogo = "assets/images/qltn_logo.png";
  static const String illustration = "assets/images/illustration.png";
  static const String splashBackground = "assets/images/splash_background.png";
}
