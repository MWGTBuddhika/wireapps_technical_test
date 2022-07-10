import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wireapps_technical_test/feature/home/entity/product.dart';
import 'package:wireapps_technical_test/utils/config/color_pallet.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';

import '../../../core/router/router_delegate.dart';
import '../../../utils/constants/assets_paths.dart';
import '../../../utils/shared_widgets/assignment_text.dart';
import '../../../utils/strings/home_strings.dart';
import '../utils/home_barrel.dart';
import 'latest_news_image_widget.dart';
class LatestProductCard extends StatelessWidget {
  const LatestProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        assignmentRouter.navigate(ProductDetailsRoute(product: product));
      },
      child: Container(
        margin: EdgeInsets.only(left: StyleSheet.blockSizeVertical),
        child:
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Positioned.fill(child:  LatestProductImageWidget(url: product.mainImage??DefaultUrlImages.imagePlaceHolder,)),
              Positioned.fill(child:Container(
                color: ColorPallet.kBlack.withOpacity(0.1),)
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:  EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeHorizontal*3,vertical: 4),
                      decoration: BoxDecoration(
                          color: ColorPallet.kDarkPurple.withOpacity(0.5),
                        borderRadius: BorderRadius.only(bottomRight:  Radius.circular(20))
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AssignmentText(
                            text:product.brandName??"",
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            textStyle: TextStyle(
                              color: ColorPallet.kWhite,
                            ),
                            fontFamily: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: StyleSheet.smallFontSize,
                                color: ColorPallet.kCardLightColor),
                          ),
                          AssignmentText(
                            text:product.name??"",
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            fontFamily: GoogleFonts.lora(fontWeight: FontWeight.bold,fontSize: StyleSheet.mediumFontSize-2,
                                color: ColorPallet.kCardLightColor),
                          ),
                        ],
                      ),
                    ),
                   product.stockStatus!="IN STOCK"? Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: StyleSheet.blockSizeVertical*2),
                      decoration: BoxDecoration(
                        color: ColorPallet.kFadedRed,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),
                      child:  AssignmentText(
                        text:product.stockStatus??"",
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        textStyle: TextStyle(
                          color: ColorPallet.kWhite,
                          fontSize: StyleSheet.xSmallFontSize,
                        ),
                      ),
                    ):SizedBox.shrink(),
                    Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(top: StyleSheet.blockSizeVertical*2),
                      decoration: BoxDecoration(
                          color: ColorPallet.kFadedRed,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))
                      ),
                      child:  AssignmentText(
                        text:(product.price?.amount??"" )+" "+ (product.price?.currency??"" ),
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        textStyle: TextStyle(
                          color: ColorPallet.kWhite,
                          fontSize: StyleSheet.smallFontSize,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  color: ColorPallet.kBlack.withOpacity(0.2),
                  padding:  EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeVertical,vertical: StyleSheet.blockSizeVertical),
                  child: AssignmentText(
                    text:product.description??"",
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    fontFamily: GoogleFonts.roboto(fontSize: StyleSheet.smallFontSize,
                        color: ColorPallet.kWhite.withOpacity(0.8)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
