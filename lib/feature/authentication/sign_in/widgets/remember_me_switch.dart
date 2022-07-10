import 'package:wireapps_technical_test/feature/authentication/utils/auth_barrel.dart';
import 'package:flutter/material.dart';

class RememberMeSwitch extends StatelessWidget {
  const RememberMeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
                activeColor: ColorPallet.kPrimaryColor,
                activeTrackColor:
                ColorPallet.kPrimaryColor.withOpacity(
                  0.5,
                ),
                value: authState.rememberMe,
                onChanged: (value) {
                  context.read<AuthBloc>().add(const ToggleRememberMe());
                }),
            AssignmentText(
              text: LoginStrings.rememberMe,
              fontSize: StyleSheet.mediumFontSize,
            ),
          ],
        );
      },
    );
  }
}
