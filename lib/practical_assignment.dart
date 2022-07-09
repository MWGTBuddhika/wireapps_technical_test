import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wireapps_technical_test/screen_distributor.dart';
import 'package:wireapps_technical_test/utils/config/style_sheet.dart';

import 'core/shared_blocs/auth_bloc/auth_bloc.dart';
import 'core/shared_blocs/theme_bloc/theme_cubit.dart';

class PracticalAssignment extends StatelessWidget {
  const PracticalAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //setting app to vertical mode only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //initialize shared_blocs
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider<AuthBloc>(
          lazy: false,
          create: (BuildContext context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: StyleSheet.getTheme(context, state.mode),
                darkTheme: StyleSheet.getTheme(context, state.mode),
                themeMode: state.mode == Brightness.dark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: const ScreenDistributor(),
              );
            },
          );
        },
      ),
    );
  }
}
