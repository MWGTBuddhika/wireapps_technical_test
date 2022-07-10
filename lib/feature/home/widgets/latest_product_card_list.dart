import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wireapps_technical_test/feature/home/entity/product.dart';

import '../bloc/home_bloc/home_bloc.dart';
import '../utils/home_barrel.dart';
import 'latest_product_card.dart';

class LatestProductCardList extends StatelessWidget {
  const LatestProductCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState) {
          return CarouselSlider.builder(
            itemCount: homeState.productList.isNotEmpty?homeState.productList.length:2,
            options: CarouselOptions(
              //height: StyleSheet.blockSizeVertical*28,
              viewportFraction: 0.9,
              scrollPhysics: BouncingScrollPhysics(),
              initialPage: 0,
              disableCenter: true,
              padEnds: false,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (BuildContext context, int itemIndex,
                int pageViewIndex) =>
                LatestProductCard(product:homeState.productList.isNotEmpty? homeState.productList[itemIndex]:Product()),
          );
        },
      );
  }
}
