
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:wireapps_technical_test/feature/home/widgets/product_card.dart';

import '../bloc/home_bloc/home_bloc.dart';
import '../utils/home_barrel.dart';


class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, homeState) {
        return AnimationLimiter(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: homeState.filteredProductList.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                  position: index,
                  delay: Duration(milliseconds: 100),
                  duration: const Duration(milliseconds: 400),
                  child: SlideAnimation(
                      verticalOffset: 100,
                      child: FadeInAnimation(
                          child: Align(child:ProductCard(product: homeState.filteredProductList[index],)))));
            },
          ),
        );
      },
    );
  }
}
