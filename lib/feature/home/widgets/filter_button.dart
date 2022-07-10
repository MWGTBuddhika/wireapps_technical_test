import 'package:flutter/material.dart';
import 'package:wireapps_technical_test/feature/home/utils/enums.dart';
import 'package:wireapps_technical_test/feature/home/widgets/product_filter_bottom_sheet.dart';
import '../../../utils/strings/home_strings.dart';
import '../../authentication/utils/auth_barrel.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../utils/home_barrel.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: BlocBuilder<HomeBloc, HomeState>(
  builder: (context, homeState) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: StyleSheet.blockSizeHorizontal*3,vertical: StyleSheet.blockSizeVertical*2),
        child: AssignmentButton(size: Size(StyleSheet.blockSizeHorizontal*10,StyleSheet.blockSizeVertical*2),
          label: HomeStrings.filter,
          color: ColorPallet.kFadedRed,
          textColor: ColorPallet.kWhite,
          borderRadius: 20,
          fontSize: StyleSheet.smallFontSize+2,
          iconData: Icons.filter_alt_outlined,
          onPressed: (){
            showModalBottomSheet(
                context: context,
                // isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context){
                  return  const ProductFilterBottomSheet();
                }
            ).then((saved){
             if(saved!=null &&saved){

             }
             else{
               context.read<HomeBloc>().add(SetProductsSortBy(ProductsSortBy.unknown));
             }
            });
          },
        ),
      );
  },
),
    );
  }
}
