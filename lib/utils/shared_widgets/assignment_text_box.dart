import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wireapps_technical_test/utils/config/color_pallet.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';
import 'package:wireapps_technical_test/utils/constants/assets_paths.dart';
import 'package:wireapps_technical_test/utils/strings/login_strings.dart';

class AssignmentTextBox extends StatelessWidget {
  const AssignmentTextBox({Key? key,
    this.hintText,
    this.hintFontSize,
    this.textSize,
    this.onChanged,
    this.onSubmit,
    this.onSaved,
    this.suffixIcon,
    this.borderOpacity,
    this.borderColor,
    this.svgIcon, this.isPassword, this.focusNode}) : super(key: key);

  final String? hintText;
  final double? hintFontSize;
  final double? textSize;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String?>? onSaved;
  final String? svgIcon;
  final bool? isPassword;
  final Icon? suffixIcon;
  final double? borderOpacity;
  final Color? borderColor;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      cursorColor: ColorPallet.kDefaultIconColor,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      onSaved: onSaved,
      obscureText: isPassword?? false,

      maxLines: 1,
      style: TextStyle(
        fontSize:textSize?? StyleSheet.defaultFontSize,
        color: ColorPallet.kPrimaryTextColor,
      ),
      decoration: InputDecoration(
          hintText:hintText??"",
          contentPadding: EdgeInsets.zero,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
              color: ColorPallet.kPrimaryTextColor.withOpacity(.6),
              fontSize: hintFontSize??StyleSheet.defaultFontSize),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: borderColor??ColorPallet.kGrey,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color:borderColor?? ColorPallet.kGrey.withOpacity(borderOpacity??0.8),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color:borderColor?? ColorPallet.kGrey.withOpacity(borderOpacity??0.8),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 25,
            minHeight: 25,
          ),
           prefixIcon:svgIcon!=null? Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: SvgPicture.asset(
              svgIcon!,
              color: ColorPallet.kDefaultIconColor,
            ),
          ):SizedBox.shrink()),
    );
  }
}
