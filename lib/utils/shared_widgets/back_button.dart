import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/router/router_delegate.dart';
import '../config/color_pallet.dart';
import '../config/style_sheet.dart';
import '../constants/assets_paths.dart';
class AssignmentBackButton extends StatelessWidget {
  const AssignmentBackButton({
    Key? key,
    this.label,
    this.iconData,
    this.onPressed,
    this.size,
  }) : super(key: key);

  final String? label;
  final IconData? iconData;
  final VoidCallback? onPressed;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed ??
              () {
                assignmentRouter.pop();
          },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: StyleSheet.blockSizeVertical,
            horizontal: StyleSheet.blockSizeVertical),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetIconPath.backIcon,
                color: ColorPallet.kDefaultIconColor,
              height: StyleSheet.blockSizeVertical * 3,
              width: StyleSheet.blockSizeVertical * 3,
            ),
            label!=null? Row(
              children: [
                const SizedBox(width: 8),
                Text(
                  label ?? "",
                  style: StyleSheet.textStyle.copyWith(
                    color: ColorPallet.kPrimaryTextColor,
                    fontSize: StyleSheet.mediumFontSize
                  ),
                )
              ],
            ):const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
