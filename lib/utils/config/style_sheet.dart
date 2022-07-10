import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_pallet.dart';

class StyleSheet {
  static String? fontFamily = GoogleFonts.roboto().fontFamily;
  static double _screenWidth = 0.0;
  static double _screenHeight = 0.0;
  static ThemeData getTheme(BuildContext context, Brightness mode) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenWidth = _screenWidth > 96 ? _screenWidth : 96 - 96;
    _screenHeight = MediaQuery.of(context).size.height;
    _screenHeight = _screenHeight > 120 ? _screenHeight : 120 - 120;
    return Theme.of(context).copyWith(
      backgroundColor: ColorPallet.kBackground,
      scaffoldBackgroundColor: ColorPallet.kBackground,
      brightness: mode,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPallet.kBackground,
        titleTextStyle: AppBarTheme.of(context).titleTextStyle?.copyWith(
              color: ColorPallet.kPrimaryTextColor,
              fontSize: 18.0,
            ),
      ),
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: fontFamily,
          ),
    );
  }

  static double get screenWidth => _screenWidth;
  static double get screenHeight => _screenHeight;
  static double get xLargeFontSize => min(screenWidth, screenHeight) * 7 / 100;
  static double get largeFontSize => min(screenWidth, screenHeight) * 5 / 100;
  static double get mediumFontSize => min(screenWidth, screenHeight) * 4 / 100;
  static double get defaultFontSize => min(screenWidth, screenHeight) * 4 / 100;
  static double get smallFontSize => min(screenWidth, screenHeight) * 3 / 100;
  static double get xSmallFontSize =>
      min(screenWidth, screenHeight) * 2.5 / 100;
  static double get blockSizeVertical => screenHeight / 100;
  static double get blockSizeHorizontal => screenWidth / 100;

  static TextStyle get textStyle =>
      TextStyle(color: ColorPallet.kPrimaryTextColor, fontSize: mediumFontSize);

  static updateLayout(BuildContext context) {
    _screenHeight = context.size?.height ?? _screenHeight;
    _screenWidth = context.size?.width ?? _screenWidth;
  }
}
