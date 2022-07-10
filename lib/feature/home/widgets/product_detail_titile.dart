import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wireapps_technical_test/utils/config/color_pallet.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';

import '../../../utils/shared_widgets/assignment_text.dart';
import '../utils/home_barrel.dart';

class ProductDetailTitle extends StatelessWidget {
  const ProductDetailTitle({Key? key,
    required this.title,
    required this.brandName}) : super(key: key);

  final String title;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15.0,
            sigmaY: 15.0,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeHorizontal*4,
            vertical: StyleSheet.blockSizeVertical),
            alignment: Alignment.center,
            width: StyleSheet.screenWidth*0.8,
            height: StyleSheet.blockSizeVertical*13,
            decoration: BoxDecoration(
              color: ColorPallet.kPrimaryGrey.withOpacity(0.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AssignmentText(
                  text:title,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  fontFamily: GoogleFonts.lora(fontWeight: FontWeight.w800,fontSize: StyleSheet.defaultFontSize,
                      color: ColorPallet.kPrimaryTextColor),
                ),
                SizedBox(height: StyleSheet.blockSizeVertical,),
                AssignmentText(
                    text:brandName,
                    fontWeight: FontWeight.w800,
                    fontSize: StyleSheet.mediumFontSize,
                    textAlign: TextAlign.start,
                    maxLines: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
