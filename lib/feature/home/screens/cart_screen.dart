import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wireapps_technical_test/feature/home/widgets/cart_list.dart';
import 'package:wireapps_technical_test/utils/strings/home_strings.dart';

import '../../authentication/utils/auth_barrel.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../widgets/bell_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, homeState) {
            return AssignmentScaffold(
              isLoading: homeState.homeStatus==HomeStatus.loading,
              trailing: BellWidget(showCart: false,),
              title:  AssignmentText(
                text: HomeStrings.cart,
                fontSize: StyleSheet.largeFontSize,
                fontWeight:FontWeight.bold,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeHorizontal*5),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(height: StyleSheet.blockSizeVertical*2,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: AssignmentText(
                        text:HomeStrings.yourAddedCartList,
                        fontFamily: GoogleFonts.lora(fontWeight: FontWeight.bold,fontSize: StyleSheet.largeFontSize,
                            color: ColorPallet.kPrimaryTextColor),
                      ),
                    ),
                    CartList(),
                    Container(
                      margin: EdgeInsets.only(top: StyleSheet.blockSizeVertical*2,bottom: StyleSheet.blockSizeVertical*2),
                      color: ColorPallet.kPrimaryTextColor.withOpacity(0.5),
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AssignmentText(
                          text:HomeStrings.totalPrice,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          fontFamily: GoogleFonts.lora(fontWeight: FontWeight.bold,fontSize: StyleSheet.mediumFontSize,
                              color: ColorPallet.kPrimaryTextColor),
                        ),
                        AssignmentText(
                          text:homeState.totalPrice.toString(),
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          fontFamily: GoogleFonts.lora(fontWeight: FontWeight.bold,fontSize: StyleSheet.mediumFontSize,
                              color: ColorPallet.kPrimaryTextColor),
                        ),
                      ],
                    ),
                    SizedBox(height: StyleSheet.blockSizeVertical*10)
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
