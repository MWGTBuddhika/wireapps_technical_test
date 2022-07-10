import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';
import '../../../core/router/router_delegate.dart';
import '../../../utils/config/color_pallet.dart';
import '../../../utils/shared_widgets/assignment_text.dart';
import '../../../utils/strings/home_strings.dart';
import '../utils/home_barrel.dart';

class LatestProductsHeader extends StatelessWidget {
  const LatestProductsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AssignmentText(
          text:HomeStrings.latestProducts,
          fontFamily: GoogleFonts.lora(fontWeight: FontWeight.bold,fontSize: StyleSheet.largeFontSize,
              color: ColorPallet.kPrimaryTextColor),
        ),
        InkWell(
          onTap: (){
            assignmentRouter.navigate( SeeAllRoute(shouldSearchFocus: false));
          },borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: StyleSheet.blockSizeVertical,horizontal: StyleSheet.blockSizeHorizontal*2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AssignmentText(
                  text: HomeStrings.seeAll,
                  textColor: ColorPallet.kBlue,
                  fontSize: StyleSheet.defaultFontSize,
                ),
                SizedBox(width: StyleSheet.blockSizeHorizontal*2,),
                Icon(Icons.arrow_forward,size: StyleSheet.blockSizeVertical*2,color: ColorPallet.kBlue,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
