
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wireapps_technical_test/feature/home/bloc/home_bloc/home_bloc.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';

import '../../../core/router/router_delegate.dart';
import '../../../utils/config/color_pallet.dart';
import '../../../utils/constants/assets_paths.dart';
import '../../../utils/shared_widgets/assignment_text.dart';
import '../entity/product.dart';
import 'latest_news_image_widget.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        assignmentRouter.navigate(ProductDetailsRoute(product: product));
      },
      child: Container(
        height: StyleSheet.blockSizeVertical*13,
        margin: EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeHorizontal*2,
            vertical: StyleSheet.blockSizeVertical*0.7),
        child:
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child:  LatestProductImageWidget(url: product.mainImage??DefaultUrlImages.imagePlaceHolder,)),
              Positioned.fill(child:Container(
                color: ColorPallet.kBlack.withOpacity(0.2),
              )
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeVertical,vertical: StyleSheet.blockSizeVertical),
                  child: AssignmentText(
                    text:product.name??"",
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    fontFamily: GoogleFonts.lora(fontWeight: FontWeight.bold,fontSize: StyleSheet.defaultFontSize-2,
                        color: ColorPallet.kCardLightColor),
                  ),
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
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeVertical,vertical: StyleSheet.blockSizeVertical),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AssignmentText(
                        text:product.price?.amount??"",
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        fontFamily: GoogleFonts.lora(fontWeight: FontWeight.bold,fontSize: StyleSheet.largeFontSize,
                            color: ColorPallet.kFadedRed),
                      ),
                      SizedBox(width: StyleSheet.blockSizeHorizontal),
                      AssignmentText(
                        text:product.price?.currency??"",
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        fontFamily: GoogleFonts.lora(fontWeight: FontWeight.bold,fontSize: StyleSheet.smallFontSize,
                            color: ColorPallet.kFadedRed),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    context.read<HomeBloc>().add(RemoveProductsCart(product));
                  },
                  child: Container(
                    width: StyleSheet.blockSizeVertical * 4,
                    height: StyleSheet.blockSizeVertical * 4,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.remove_shopping_cart,
                      color: ColorPallet.kWhite,
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
