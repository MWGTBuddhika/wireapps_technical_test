import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wireapps_technical_test/core/router/router.dart';
import 'package:wireapps_technical_test/core/shared_blocs/auth_bloc/auth_bloc.dart';

import '../../../core/shared_blocs/theme_bloc/theme_cubit.dart';
import '../../../utils/config/color_pallet.dart';
import '../../../utils/config/style_sheet.dart';
import '../utils/home_barrel.dart';
import 'package:flutter/material.dart';

class BellWidget extends StatelessWidget {
  const BellWidget({Key? key,this.showCart=true}) : super(key: key);

  final bool showCart;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                context.read<ThemeCubit>().toggleDarkMode();
              },
              child: Container(
                width: StyleSheet.blockSizeVertical * 5,
                height: StyleSheet.blockSizeVertical * 5,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  state.mode==Brightness.light? Icons.nightlight_outlined:Icons.wb_sunny_outlined,
                  color: ColorPallet.kWhite,
                ),
              ),
            ),
            SizedBox(width: StyleSheet.blockSizeHorizontal,),
            showCart?  GestureDetector(
              onTap: () {
                assignmentRouter.navigate(CartRoute());
              },
              child: Container(
                width: StyleSheet.blockSizeVertical * 5,
                height: StyleSheet.blockSizeVertical * 5,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                 Icons.shopping_cart_outlined,
                  color: ColorPallet.kWhite,
                ),
              ),
            ):GestureDetector(
              onTap: () {
               context.read<AuthBloc>().add(SignOut());
              },
              child: Container(
                width: StyleSheet.blockSizeVertical * 5,
                height: StyleSheet.blockSizeVertical * 5,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.exit_to_app,
                  color: ColorPallet.kWhite,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
