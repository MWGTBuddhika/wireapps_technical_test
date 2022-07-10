import '../../../utils/shared_widgets/loading_circle/loading_circle.dart';
import '../../authentication/utils/auth_barrel.dart';
import '../utils/home_barrel.dart';

class SeeAllScreenLoadingWidget extends StatelessWidget {
  const SeeAllScreenLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorPallet.kAppLoadingColor.withOpacity(0.6),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingCircle(
                  size: StyleSheet.blockSizeVertical * 6.5,
                  color: ColorPallet.kScaffoldBackGroundGradientColor1,
                ),
                SizedBox(
                  height: StyleSheet.blockSizeVertical,
                ),
                AssignmentText(
                    text: CommonStrings.pleaseWait,
                    textStyle: TextStyle(
                        color: ColorPallet.kScaffoldBackGroundGradientColor1,
                        fontSize: StyleSheet.smallFontSize + 2)),
                AssignmentText(
                    text: CommonStrings.gettingThingsReady +
                        "...",
                    textStyle: TextStyle(
                        color: ColorPallet.kScaffoldBackGroundGradientColor1,
                        fontSize: StyleSheet.smallFontSize + 2)),
              ],
            )));
  }
}
