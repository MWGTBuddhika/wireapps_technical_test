import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/config/color_pallet.dart';
import '../../../utils/config/style_sheet.dart';
import '../../../utils/shared_widgets/assignment_text.dart';
import '../utils/home_barrel.dart';
class ProductDetailDescription extends StatelessWidget {
  const ProductDetailDescription({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeHorizontal*4),
        child: Column(
          children: [
            SizedBox(height: StyleSheet.blockSizeVertical*10,),
            AssignmentText(
                text:content,
                textAlign: TextAlign.start,
                maxLines: content.length,
                fontFamily: GoogleFonts.lora(fontWeight: FontWeight.w600,fontSize: StyleSheet.defaultFontSize-2,
                color: ColorPallet.kPrimaryTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
