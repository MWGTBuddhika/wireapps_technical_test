import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/shared_blocs/theme_bloc/theme_cubit.dart';
import '../config/color_pallet.dart';
class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(4.0),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Switch(
              activeColor: ColorPallet.kCardBackground,
              activeTrackColor:
              ColorPallet.kGrey.withOpacity(
                0.5,
              ),
              value: state.mode == Brightness.dark,
              onChanged: (value) {
                context.read<ThemeCubit>().toggleDarkMode();
              });
        },
      ),
    );
  }
}
