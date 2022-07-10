import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/shared_blocs/theme_bloc/theme_cubit.dart';
import '../config/color_pallet.dart';
import '../config/style_sheet.dart';
import '../strings/common_strings.dart';
import 'assignment_text.dart';
import 'back_button.dart';
import 'loading_circle/loading_circle.dart';

class AssignmentScaffold extends StatelessWidget {
  const AssignmentScaffold({
    Key? key,
    this.leading,
    this.title,
    this.child,
    this.trailing,
    this.bottomNavbar,
    this.resizeOnKeyboard = false,
    this.isLoading = false,
    this.toolbarPadding,
    this.toolbarElevation,
    this.toolbarHeight,
    this.appbarBackground,
    this.showAppbar = true,
    this.loadingWidget,
  }) : super(key: key);
  final Widget? child;
  final Widget? trailing;
  final Widget? leading;
  final Widget? title;
  final Widget? bottomNavbar;
  final bool isLoading;
  final bool showAppbar;
  final Widget? loadingWidget;
  final double? toolbarHeight;
  final bool resizeOnKeyboard;
  final double? toolbarPadding;
  final double? toolbarElevation;
  final Color? appbarBackground;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocBuilder(
        bloc: context.read<ThemeCubit>(),
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                  child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ColorPallet.kScaffoldBackGroundGradientColor1,
                      ColorPallet.kScaffoldBackGroundGradientColor2
                    ],
                  ),
                ),
              )),
              Scaffold(
                appBar: showAppbar
                    ? AppBar(
                        systemOverlayStyle: ColorPallet.kStatusBarColor,
                        titleSpacing:
                            toolbarPadding ?? StyleSheet.blockSizeHorizontal,
                        centerTitle: true,
                        automaticallyImplyLeading: false,
                        elevation: toolbarElevation ?? 0,
                        toolbarHeight:
                            toolbarHeight ?? StyleSheet.blockSizeVertical * 8,
                        title: Container(
                          height:
                              toolbarHeight ?? StyleSheet.blockSizeVertical * 8,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: LeadingWidget(child: leading),
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: TitleWidget(child: title)),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TrailingWidget(trailing: trailing),
                              )
                            ],
                          ),
                        ),
                        backgroundColor:
                            appbarBackground ?? ColorPallet.kAppBarColor,
                      )
                    : AppBar(
                        toolbarHeight: 0,
                        elevation: 0,systemOverlayStyle: ColorPallet.kStatusBarColor,
                      ),
                backgroundColor: ColorPallet.kTransparent,
                body: child,
                bottomNavigationBar: bottomNavbar,
                resizeToAvoidBottomInset: resizeOnKeyboard,
              ),
              isLoading
                  ? loadingWidget != null
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: loadingWidget,
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: ColorPallet.kAppLoadingColor.withOpacity(0.6),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoadingCircle(
                                size: StyleSheet.blockSizeVertical * 6.5,
                                color: ColorPallet
                                    .kScaffoldBackGroundGradientColor1,
                              ),
                              SizedBox(
                                height: StyleSheet.blockSizeVertical,
                              ),
                              AssignmentText(
                                  text: CommonStrings.pleaseWait,
                                  textStyle: TextStyle(
                                      color: ColorPallet
                                          .kScaffoldBackGroundGradientColor1,
                                      fontSize: StyleSheet.smallFontSize + 2)),
                              AssignmentText(
                                  text:
                                      CommonStrings.gettingThingsReady + "...",
                                  textStyle: TextStyle(
                                      color: ColorPallet
                                          .kScaffoldBackGroundGradientColor1,
                                      fontSize: StyleSheet.smallFontSize + 2)),
                            ],
                          )))
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}

class LeadingWidget extends StatelessWidget {
  const LeadingWidget({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return Container(child: child);
    } else if (Navigator.canPop(context)) {
      return const AssignmentBackButton();
    }

    return const SizedBox.shrink();
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    this.child,
  }) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return Container(child: child);
    }
    return const SizedBox.shrink();
  }
}

class TrailingWidget extends StatelessWidget {
  const TrailingWidget({
    Key? key,
    this.trailing,
  }) : super(key: key);
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    if (trailing != null) {
      return Container(
          padding: EdgeInsets.symmetric(
              vertical: StyleSheet.blockSizeVertical,
              horizontal: StyleSheet.blockSizeVertical),
          child: trailing);
    }
    return const SizedBox.shrink();
  }
}
