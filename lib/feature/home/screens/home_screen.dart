import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../../core/router/router_delegate.dart';
import '../../../core/shared_blocs/theme_bloc/theme_cubit.dart';
import '../../../utils/shared_widgets/assignment_scaffold.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../widgets/bell_widget.dart';
import '../widgets/brand_filter_button_row.dart';
import '../widgets/latest_product_section.dart';
import '../widgets/product_list.dart';
import '../widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<HomeBloc>().add(const FetchProducts());
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, homeState) {
            return AssignmentScaffold(
              isLoading: homeState.homeStatus==HomeStatus.loading,
              leading: SearchWidget(ignoring: true,onTap: (){
                assignmentRouter.navigate( SeeAllRoute(shouldSearchFocus: true));
              },),
              trailing: BellWidget(),
              child: RefreshIndicator(
                onRefresh: ()async{
                  context.read<HomeBloc>().add(FetchProducts());
                },
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    LatestProductSection(),
                    BrandFilterButtonRow(),
                    ProductList(),
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
