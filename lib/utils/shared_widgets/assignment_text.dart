import 'package:flutter/material.dart';

import '../config/color_pallet.dart';
import '../config/style_sheet.dart';

class AssignmentText extends StatelessWidget {
  const AssignmentText({Key? key,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textDecoration,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,softWrap: true,
      style: textStyle??TextStyle(
        decoration: textDecoration,
        color:textColor?? ColorPallet.kPrimaryTextColor,
        fontSize:fontSize?? StyleSheet.mediumFontSize,
        fontWeight:fontWeight?? FontWeight.w400,
        overflow: TextOverflow.ellipsis,
      ),
      textAlign: textAlign?? TextAlign.center,
      overflow: textOverflow?? TextOverflow.ellipsis,
      maxLines: maxLines??2,
    );
  }
}
