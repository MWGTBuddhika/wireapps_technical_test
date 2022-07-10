import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wireapps_technical_test/feature/authentication/utils/auth_barrel.dart';

import '../utils/home_barrel.dart';
class ProductDetailsHeaderImage extends StatelessWidget {
  const ProductDetailsHeaderImage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: StyleSheet.screenHeight*0.5,
      fit: BoxFit.fitWidth,
      imageUrl:url,
      placeholder: (context, url) =>  Container(
        width: StyleSheet.blockSizeVertical*4,
        height: StyleSheet.blockSizeVertical*4,

        child: Shimmer.fromColors(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center => Center Column contents horizontally,
              children: <Widget>[
                Container(
                  child: Icon(
                    Icons.photo,
                    size: StyleSheet.blockSizeVertical*15,
                  ),
                ),
              ],
            ),
            baseColor:ColorPallet.kPrimaryTextColor.withOpacity(.5),
            highlightColor: ColorPallet.kPrimaryGrey),
      ),
      errorWidget: (context, url, error) => Container(
        width: StyleSheet.blockSizeVertical*4,
        height: StyleSheet.blockSizeVertical*4,
        child: Container(
          child: Icon(
            Icons.broken_image,
            size: StyleSheet.blockSizeVertical*15,color: ColorPallet.kPrimaryTextColor.withOpacity(.5),
          ),
        ),
      ),
      fadeInCurve: Curves.easeIn,
      fadeInDuration: const Duration(milliseconds: 100),
    );
  }
}
