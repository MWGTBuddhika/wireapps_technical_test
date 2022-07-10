import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wireapps_technical_test/feature/home/utils/enums.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';

import '../../../utils/config/color_pallet.dart';
import '../../../utils/shared_widgets/assignment_button.dart';
import '../../../utils/strings/home_strings.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../utils/home_barrel.dart';

class BrandFilterButtonRow extends StatelessWidget {
  const BrandFilterButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: StyleSheet.blockSizeVertical * 2,
                horizontal: StyleSheet.blockSizeHorizontal * 2),
            child: Row(
              children: [
                filterButton(
                    labelText: HomeStrings.all,
                    brandFilter: BrandFilter.unknown,
                    onPressed: () => context.read<HomeBloc>().add(
                        const SetProductsBrandFilter( BrandFilter.unknown)),
                    homeState: homeState),
                SizedBox(
                  width: StyleSheet.blockSizeVertical,
                ),
                filterButton(
                    labelText: HomeStrings.nike,
                    brandFilter: BrandFilter.Nike,
                    onPressed: () => context.read<HomeBloc>().add(
                        const SetProductsBrandFilter( BrandFilter.Nike)),
                    homeState: homeState),
                SizedBox(
                  width: StyleSheet.blockSizeVertical,
                ),
                filterButton(
                    labelText: HomeStrings.puma,
                    brandFilter: BrandFilter.Puma,
                    onPressed: () => context.read<HomeBloc>().add(
                        const SetProductsBrandFilter(
                            BrandFilter.Puma)),
                    homeState: homeState),
                SizedBox(
                  width: StyleSheet.blockSizeVertical,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget filterButton(
          {required String labelText,
          required BrandFilter brandFilter,
          required Function() onPressed,
          required HomeState homeState}) =>
      AssignmentButton(
        label: labelText,
        color: homeState.brandFilter == brandFilter
            ? ColorPallet.kFadedRed
            : null,
        textColor: homeState.brandFilter == brandFilter
            ? ColorPallet.kWhite
            : ColorPallet.kPrimaryTextColor,
        borderRadius: 20,
        onPressed: onPressed,
      );
}
