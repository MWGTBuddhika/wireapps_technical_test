import 'package:flutter/material.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';

import '../utils/home_barrel.dart';
import 'latest_product_card_list.dart';
import 'latest_product_header.dart';



class LatestProductSection extends StatelessWidget {
  const LatestProductSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: StyleSheet.blockSizeVertical*2,left: StyleSheet.blockSizeHorizontal*4,
              right: StyleSheet.blockSizeHorizontal*4),
          child: LatestProductsHeader(),
        ),
        SizedBox(height: StyleSheet.blockSizeVertical*2,),
        LatestProductCardList()
      ],
    );
  }
}
