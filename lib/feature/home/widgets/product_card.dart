
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';

import '../../../core/router/router_delegate.dart';
import '../../../utils/config/color_pallet.dart';
import '../../../utils/constants/assets_paths.dart';
import '../../../utils/shared_widgets/assignment_text.dart';
import '../entity/product.dart';
import 'latest_news_image_widget.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        assignmentRouter.navigate(ProductDetailsRoute(product: product));
      },
      child: Container(
        height: StyleSheet.blockSizeVertical*20,
        margin: EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeHorizontal*2,
            vertical: StyleSheet.blockSizeVertical*0.7),
        child:
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Positioned.fill(child:  LatestProductImageWidget(url: product.mainImage??DefaultUrlImages.imagePlaceHolder,)),
              Positioned.fill(child:Container(
                color: ColorPallet.kBlack.withOpacity(0.2),
              )
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeVertical,vertical: StyleSheet.blockSizeVertical),
                      child: AssignmentText(
                        text:product.name??"",
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        fontFamily: GoogleFonts.lora(fontWeight: FontWeight.bold,fontSize: StyleSheet.defaultFontSize-2,
                            color: ColorPallet.kCardLightColor),
                      ),
                    ),
                    product.stockStatus!="IN STOCK"? Container(
                      padding: EdgeInsets.all(8),
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
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: StyleSheet.blockSizeVertical,horizontal: StyleSheet.blockSizeHorizontal*2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: AssignmentText(
                          text:product.brandName??"",
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          fontFamily: GoogleFonts.roboto(fontSize: StyleSheet.smallFontSize,
                              color: ColorPallet.kCardLightColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
