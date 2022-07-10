import 'dart:ui';

import 'package:flutter/material.dart';
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
                showAppbar: false,
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Container(
                          child: Image.asset(AssetImagePath.splashImage,
                              fit: BoxFit.fill),
                        )),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5.0,
                        sigmaY: 5.0,
                      ),
                      child: Container(color:ColorPallet.kBlurBackGroundColor,
                        height: double.infinity,
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AssignmentText(
                            text: CommonStrings.changeTheme,
                            fontSize: StyleSheet.mediumFontSize,
                            fontWeight: FontWeight.w900,
                            maxLines: 3,
                          ),
                          ThemeSwitch(),
                        ],
                      ),
                    )
                  ],
                )
            );
          },
        );
      },
    );
  }
}
