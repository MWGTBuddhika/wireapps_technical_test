import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:wireapps_technical_test/feature/home/widgets/product_card.dart';

import '../../authentication/utils/auth_barrel.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../utils/home_barrel.dart';


class SearchResultList extends StatelessWidget {
  const SearchResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, homeState) {
          return AnimationLimiter(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount:homeState.searchProductList.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: Duration(milliseconds: 100),
                    duration: const Duration(milliseconds: 400),
                    child: SlideAnimation(
                        verticalOffset: 100,
                        child: FadeInAnimation(
                            child: Align(child:ProductCard(product: homeState.searchProductList[index],)))));
              },
            ),
          );
        },
      ),
    );
  }
}

