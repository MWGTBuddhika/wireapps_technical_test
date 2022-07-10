import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wireapps_technical_test/core/shared_blocs/auth_bloc/auth_bloc.dart';
import 'package:wireapps_technical_test/utils/shared_widgets/assignment_scaffold.dart';

import '../../../core/router/router_delegate.dart';
import '../../../utils/constants/assets_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    context.read<AuthBloc>().add(CheckSignedIn());
    FlutterNativeSplash.remove();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AssignmentScaffold(
      showAppbar: false,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
                AssetImagePath.splashImage,
                fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}
