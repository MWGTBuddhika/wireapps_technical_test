import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wireapps_technical_test/feature/home/bloc/home_bloc/home_bloc.dart';
import 'package:wireapps_technical_test/feature/home/utils/enums.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';

import '../../../core/router/router_delegate.dart';
import '../../../utils/config/color_pallet.dart';
import '../../../utils/shared_widgets/assignment_text.dart';
import '../../../utils/strings/home_strings.dart';
import '../utils/home_barrel.dart';
class ProductFilterBottomSheet extends StatelessWidget {
  const ProductFilterBottomSheet({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           headerBar(),
            headerTile(),
            sortByButtons(),
            saveButton()
          ],
        ),
      ),
    );
  }
  Widget headerBar() {
    return Material(
      color: ColorPallet.kCardBackground,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
      child: Container(
        width: StyleSheet.screenWidth,
        height: StyleSheet.blockSizeVertical*4,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(13))),
        padding: EdgeInsets.all(StyleSheet.blockSizeHorizontal),
        child: Align(
          child: Container(
            height: 5,
            width: StyleSheet.blockSizeHorizontal*20,
            decoration: BoxDecoration(
                color: ColorPallet.kDisabledColor.withOpacity(0.9),
                borderRadius: const BorderRadius.all( Radius.circular(20))),
          ),
        ),
      ),
    );
  }
  Widget headerTile() {
    return BlocBuilder<HomeBloc, HomeState>(
  builder: (context, homeState) {
    return Material(
      color: ColorPallet.kCardBackground,
      child: Container(
        width: StyleSheet.screenWidth,
        decoration: BoxDecoration(
            color: ColorPallet.kCardBackground),
        padding: EdgeInsets.all(StyleSheet.blockSizeHorizontal * 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AssignmentText(
              text: HomeStrings.filter,
              textStyle: TextStyle(
                  fontSize: StyleSheet.largeFontSize,
                  color: ColorPallet.kPrimaryTextColor.withOpacity(0.8),
                  fontWeight: FontWeight.w900),),
            InkWell(
              onTap: (){
                context.read<HomeBloc>().add(SetProductsSortBy(ProductsSortBy.unknown));
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                alignment: Alignment.center,
                width: StyleSheet.blockSizeHorizontal*20,
                height: StyleSheet.blockSizeVertical*4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: ColorPallet.kPrimaryTextColor.withOpacity(0.3))
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.delete_outline,size: StyleSheet.mediumFontSize,
                        color: ColorPallet.kPrimaryTextColor.withOpacity(0.8)),
                    AssignmentText(
                      text: HomeStrings.reset,
                      textStyle: TextStyle(
                          fontSize: StyleSheet.smallFontSize,
                          color: ColorPallet.kPrimaryTextColor.withOpacity(0.8)),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  },
);
  }

  Widget sortByButtons(){
    return Material(
      color: ColorPallet.kCardBackground,
      child:Container(
        width: StyleSheet.screenWidth,
        decoration: BoxDecoration(
            color: ColorPallet.kCardBackground),
        padding: EdgeInsets.all(StyleSheet.blockSizeHorizontal * 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AssignmentText(
              text: HomeStrings.sortBy,
              textStyle: TextStyle(
                  fontSize: StyleSheet.mediumFontSize,
                  color: ColorPallet.kPrimaryTextColor.withOpacity(0.8),
                  fontWeight: FontWeight.w400),),
            SizedBox(height: StyleSheet.blockSizeVertical),
            Wrap(
              children: [
                sortButton(productsSortBy: ProductsSortBy.inStock,btnText: HomeStrings.inStock),
                SizedBox(width: StyleSheet.blockSizeHorizontal*4,),
                sortButton(productsSortBy: ProductsSortBy.outOfStock,btnText: HomeStrings.outOfStock),
                SizedBox(width: StyleSheet.blockSizeHorizontal*4,),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget sortButton({required ProductsSortBy productsSortBy,required String btnText}){
    return  BlocBuilder<HomeBloc, HomeState>(
  builder: (context, homeState) {
    return InkWell(
      onTap: (){
        context.read<HomeBloc>().add(SetProductsSortBy(productsSortBy));
      },
      borderRadius: BorderRadius.circular(20),
      child: Container(
        alignment: Alignment.center,
        width: StyleSheet.blockSizeHorizontal*20,
        height: StyleSheet.blockSizeVertical*4,
        decoration: BoxDecoration(
          color: homeState.productsSortBy == productsSortBy?ColorPallet.kFadedRed:null,
            borderRadius: BorderRadius.circular(20),
            border:homeState.productsSortBy == productsSortBy?null: Border.all(color: ColorPallet.kPrimaryTextColor.withOpacity(0.3))
        ),
        child: AssignmentText(
          text: btnText,
          textStyle: TextStyle(
              fontSize: StyleSheet.smallFontSize,
              color:homeState.productsSortBy == productsSortBy?ColorPallet.kWhite: ColorPallet.kPrimaryTextColor.withOpacity(0.8)),),
      ),
    );
  },
);
  }

  Widget saveButton() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        return Material(
          color: ColorPallet.kCardBackground,
          child: Container(
            width: StyleSheet.screenWidth,
            decoration: BoxDecoration(
                color: ColorPallet.kCardBackground),
            padding: EdgeInsets.all(StyleSheet.blockSizeHorizontal * 8),
            child: InkWell(
                onTap: (){
                  assignmentRouter.pop(true);
                },
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  alignment: Alignment.center,
                  width: StyleSheet.blockSizeHorizontal*20,
                  height: StyleSheet.blockSizeVertical*4,
                  decoration: BoxDecoration(
                    color: ColorPallet.kFadedRed,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: AssignmentText(
                    text: HomeStrings.save,
                    textStyle: TextStyle(
                        fontSize: StyleSheet.smallFontSize,
                        color:ColorPallet.kWhite),
                  ),
                )),
          ),
        );
      },
    );
  }
}