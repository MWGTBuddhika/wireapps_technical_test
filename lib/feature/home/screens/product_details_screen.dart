import 'package:flutter/material.dart';
import 'package:wireapps_technical_test/feature/authentication/utils/auth_barrel.dart';
import 'package:wireapps_technical_test/feature/home/bloc/home_bloc/home_bloc.dart';
import 'package:wireapps_technical_test/feature/home/entity/product.dart';
import 'package:wireapps_technical_test/feature/home/widgets/product_detail_titile.dart';
import 'package:wireapps_technical_test/feature/home/widgets/products_details_header_image.dart';

import '../../../utils/shared_widgets/assignment_scaffold.dart';
import '../utils/home_barrel.dart';
import '../widgets/product_detail_description.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return AssignmentScaffold(
      showAppbar: false,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                height: StyleSheet.screenHeight*0.4,
                child: ProductDetailsHeaderImage(
                    url: product.mainImage??DefaultUrlImages.imagePlaceHolder)),
          ),
          Align(
            alignment: Alignment(0,1.4),
            child: Container(
              height: StyleSheet.screenHeight*0.6,
              decoration: BoxDecoration(
                color: ColorPallet.kCardBackground,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
              ),
              child: ProductDetailDescription(
                content: product.description??"",
              ),
            ),
          ),
          Align(
            alignment: Alignment(0,-0.1),
              child: ProductDetailTitle(
                title: product.name??"",
                brandName: product.brandName??"",
              ),
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: StyleSheet.blockSizeHorizontal*2,
                  top: StyleSheet.blockSizeVertical*2),
                  child: AssignmentBackButton(),
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
            alignment: Alignment.topRight,
            child: Column(
              children: [
                Container(
                  padding:  EdgeInsets.only(right: StyleSheet.blockSizeHorizontal*2,
                      top: StyleSheet.blockSizeVertical*2),
                  child: GestureDetector(
                    onTap: () {
                      context.read<HomeBloc>().add(AddProductsToCart(product));
                    },
                    child: Container(
                      width: StyleSheet.blockSizeVertical * 5,
                      height: StyleSheet.blockSizeVertical * 5,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add_shopping_cart,
                        color: ColorPallet.kWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
