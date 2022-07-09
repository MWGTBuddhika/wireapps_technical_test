import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/router/router_delegate.dart';
import '../config/color_pallet.dart';
import '../config/style_sheet.dart';
import '../constants/assets_paths.dart';
class AssignmentButton extends StatelessWidget {
  const AssignmentButton({
    Key? key,
    this.label,
    this.iconData,
    this.onPressed,
    this.size,
    this.color,
    this.textColor,
    this.borderRadius,
    this.fontSize
  }) : super(key: key);

  final String? label;
  final IconData? iconData;
  final VoidCallback? onPressed;
  final Size? size;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius??10),
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: StyleSheet.blockSizeVertical,
            horizontal: StyleSheet.blockSizeVertical),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius??10),
          border: Border.all(color: color??ColorPallet.kPrimaryTextColor.withOpacity(0.3))
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(AssetIconPath.backIcon,
            //   color: ColorPallet.kDefaultIconColor,
            //   height: StyleSheet.blockSizeVertical * 3,
            //   width: StyleSheet.blockSizeVertical * 3,
            // ),
            iconData!=null?
                Icon(
                  iconData,
                  color: textColor,size: fontSize,
                ):
                SizedBox.shrink(),
            label!=null? Row(
              children: [
                const SizedBox(width: 8),
                Text(
                  label ?? "",
                  style: StyleSheet.textStyle.copyWith(
                      color:textColor?? ColorPallet.kPrimaryTextColor,
                      fontSize:fontSize?? StyleSheet.mediumFontSize
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ):const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
