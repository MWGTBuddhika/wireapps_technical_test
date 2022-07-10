import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';

import 'core/shared_blocs/theme_bloc/theme_cubit.dart';
import 'core/router/router_delegate.dart';

class ScreenDistributor extends StatefulWidget {
  const ScreenDistributor({Key? key}) : super(key: key);

  @override
  State<ScreenDistributor> createState() => _ScreenDistributorState();
}

class _ScreenDistributorState extends State<ScreenDistributor>{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<ThemeCubit>(),
      builder: (ctx, ThemeState state) {
        return Theme(
          data: ThemeData(fontFamily: StyleSheet.fontFamily),
          child: MaterialApp.router(
            routerDelegate: assignmentRouter.delegate(),
            routeInformationParser: assignmentRouter.defaultRouteParser(),
            theme: StyleSheet.getTheme(context, state.mode),
            darkTheme: StyleSheet.getTheme(context, state.mode),
            debugShowCheckedModeBanner: false,
            themeMode: state.mode == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
          ),
        );
      },
    );
  }
}
