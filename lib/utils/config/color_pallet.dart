import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorPallet {
  static bool _isDark = false;
  static Brightness _theme = Brightness.light;

  static bool isDark = _isDark;

  static setThemeMode(Brightness mode) {
    _theme = mode;
    _isDark = mode == Brightness.dark;
  }

  Brightness get theme => _theme;

  static Color get kLightGreen => const Color(0xFF3DCA64);
  static Color get kFadedGreen => const Color(0xFF57C454);
  static Color get kSimpleLightGreen => const Color(0xFF86D57F);
  static Color get kBrightGreen => const Color(0xFF219653);
  static Color get kBrightGreen2 => const Color(0xFF27AE60);
  static Color get kDarkShadeGreen => const Color(0xFF2D781A);
  static Color get kGreen => const Color(0xFF2D781B);
  static Color get kBlack => Colors.black;
  static Color get kDark => const Color(0xFF404040);
  static Color get kGrey => const Color(0xFF7D7D7D);
  static Color get kWhite => const Color(0xFFFFFFFF);
  static Color get kYellow => Colors.yellow;
  static Color get kFadedYellow => const Color(0xFFEFCA49);
  static Color get kDarkYellow => const Color(0xFFD29D35);
  static Color get kOrange => Colors.orangeAccent;
  static Color get kRed => const Color(0xFFDB4040);
  static Color get kFadedRed => const Color(0xFFDB4040);
  static Color get kDarkRed => const Color(0xFFAF2709);
  static Color get kDarkBlue => const Color(0xFF144F93);
  static Color get kBlue => Colors.blue;
  static Color get kHeaderGradientColor1 => const Color(0xFFAA875A);
  static Color get kHeaderGradientColor2 => const Color(0xFFBA9765);
  static Color get kHeaderGradientColor3 => const Color(0xFF7E5A2F);
  static Color get kPrimaryColor => const Color(0xFF25A0A2);
  static Color get kCardLightColor => const Color(0xFFE7EBF0);
  static Color get kNavFooterColor => const Color(0xFF656878);
  static Color get kCopyRightColor => const Color(0xFFA2A6BB);
  static Color get kDarkBackGround => const Color(0xFF2F2E2D);
  static Color get kLightBackGround => const Color(0xFFF8F8F8);
  static Color get kTransparent => Colors.transparent;
  static Color get kTextFormFieldColor =>
      const Color(0xFF573E21).withOpacity(0.1);
  static Color get kInkSplashColor => const Color(0x55a0a3a3);
  static Color get kInkHighlightColor => const Color(0x55a0a3a3);
  static Color get kMagenta=> const Color(0xFFB01E76);
  static Color get kPurple=> const Color(0xFF8F5EF6);
  static Color get kDarkPurple=> const Color(0xFF5E39AF);
  static Color get kDarkGreen=> const Color(0xFF267B84);

  static Color get kPrimaryGrey => const Color(0xFFC4C4C4);
  static Color get kSecondaryGrey => const Color(0xFFEAEAEA);

  static Color get kDefaultIconColor =>
      _isDark ? const Color(0xFFE7EBF0) : const Color(0xFF383838);

  static Color get kShimmerColor =>
      _isDark ? const Color(0xFFF3F3F3) : const Color(0xFFAAA8A8);

  static Color get kLoadingColor =>
      _isDark ? const Color(0xFFB8B8B8) : const Color(0xFFBBBBBB);

  static Color get kDisabledColor =>
      _isDark ? const Color(0xFF7D7D7D) : const Color(0xFFC4C4C4);

  static Color get kCardBackground =>
      _isDark ? const Color(0xFF424242) : const Color(0xFFFFFFFF);

  static Color get kBackButtonColor =>
      _isDark ? const Color(0xFF686666) : const Color(0xFFC4C1C1);
  static Color get kBackground => _isDark ? kDarkBackGround : kWhite;

  static Color get kInverseBackground =>
      _isDark ? kLightBackGround : kDarkBackGround;

  static Color get kPrimaryTextColor =>
      _isDark ? const Color(0xfff6f6f6) : const Color(0xFF0E252D);

  static Color get kBlurBackGroundColor =>
      _isDark ? const Color(0xAE000000) : const Color(0xB4D4D4D4);

  static Color get kBackButtonTextColor =>
      _isDark ? const Color(0xFFDADADA) : Colors.white;

  static Color get kCardShadowColor => Colors.black.withOpacity(0.9);

  static Color get kCardInnerShadowColor => _isDark ? kBackground : Colors.grey;

  static Color get kCardDropShadowColor =>
      _isDark ? Colors.transparent : const Color.fromRGBO(255, 255, 255, 0.25);

  static Color get invertColor =>
      _isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000);

  static Color get kCardBorderColor => _isDark
      ? Colors.grey.withOpacity(0.2)
      : const Color.fromRGBO(255, 255, 255, 0.25);

  static Color get kAppBarColor =>
      _isDark ? const Color(0xff007f77) : const Color(0xFF00a69c);

  static Color get kAppLoadingColor =>
      _isDark ? const Color(0xFFCEC7C7) : const Color(0xFF31302F);


  static Color get kNavBarColor =>
      _isDark ? const Color(0xFFEEECE9) : const Color(0xFFEEECE9);

  static Color get kAppBackGroundColor =>
      _isDark ? const Color(0xFF2F2E2D) : const Color(0xFFBEBEBE);

  static Color get kScaffoldBackGroundGradientColor1 =>
      _isDark ? Color(0xFF2F2E2D) : const Color(0xFFFFFFFF);
  static Color get kScaffoldBackGroundGradientColor2 =>
      _isDark ? Color(0xFF2F2E2D) : const Color(0xFFF0F0F0);

  static Color get kBackGroundGradientColor1 =>
      _isDark ? Color(0xFF2F2E2D) : Color(0xFFFFFFFF);
  static Color get kBackGroundGradientColor2 =>
      _isDark ? Color(0xFF2F2E2D) : Color(0xFFFFFFFF);

  static SystemUiOverlayStyle get kStatusBarColor =>
      _isDark ? const SystemUiOverlayStyle(
        statusBarColor: Color(0xff007f77),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xff007f77),
        systemNavigationBarIconBrightness: Brightness.light,
      ):
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF00a69c),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFF00a69c),
        systemNavigationBarIconBrightness: Brightness.dark,
      );

}
