import 'package:wireapps_technical_test/feature/authentication/utils/auth_barrel.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, themeState) {
            return AssignmentScaffold(
                resizeOnKeyboard: true,
                showAppbar: true,
                trailing: ThemeSwitch(),
                child: Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: StyleSheet.blockSizeVertical * 3),
                              child: Image.asset(AssetImagePath.appIcon,
                                  height: StyleSheet.blockSizeVertical * 17,
                                  fit: BoxFit.cover),
                            ),
                            AssignmentText(
                              text: CommonStrings.welcome,
                              fontSize: StyleSheet.xLargeFontSize,
                              fontWeight: FontWeight.w900,
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: StyleSheet.blockSizeVertical * 4,
                            ),
                            AssignmentText(
                                text: CommonStrings.firstTimeUser,
                                fontSize: StyleSheet.mediumFontSize),
                            SizedBox(
                              height: StyleSheet.blockSizeVertical * 2,
                            ),
                            AssignmentButton(
                              label: LoginStrings.signUp,
                              onPressed: () {
                                assignmentRouter.navigate(SignUpRoute());
                              },
                            ),
                            SizedBox(
                              height: StyleSheet.blockSizeVertical * 4,
                            ),
                            AssignmentText(
                                text: LoginStrings.alreadyRegistered,
                                fontSize: StyleSheet.mediumFontSize),
                            SizedBox(
                              height: StyleSheet.blockSizeVertical * 2,
                            ),
                            AssignmentButton(
                              label: LoginStrings.signIn,
                              onPressed: () {
                                assignmentRouter.navigate(SignInRoute());
                              },
                            ),
                          ],
                        ),
                      )),
                )
            );
          },
        );
      },
    );
  }
}
