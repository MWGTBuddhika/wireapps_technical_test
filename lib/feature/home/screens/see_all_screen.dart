import '../../authentication/utils/auth_barrel.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../utils/home_barrel.dart';
import '../widgets/bell_widget.dart';
import '../widgets/filter_button.dart';
import '../widgets/search_result_list.dart';
import '../widgets/search_widget.dart';
import '../widgets/see_all_screen_loading_widget.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({Key? key,this.shouldSearchFocus=false}) : super(key: key);

  final bool shouldSearchFocus;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocBuilder<HomeBloc, HomeState>(
          builder: (context, homeState) {
            return AssignmentScaffold(
              leading: Row(
                children: [
                  AssignmentBackButton(),
                  Flexible(child: SearchWidget(shouldFocus: shouldSearchFocus)),
                ],
              ),
              trailing: BellWidget(),
              child: Stack(
                children: [
                  Column(
                    //physics: const BouncingScrollPhysics(),
                    children: const [
                      FilterButton(),
                      SearchResultList()
                    ],
                  ),
                  homeState.homeStatus==HomeStatus.loading?
                  Positioned.fill(child: SeeAllScreenLoadingWidget())
                      :SizedBox.shrink()
                ],
              ),
            );
          },
        );
      },
    );
  }
}
