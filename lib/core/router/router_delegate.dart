import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../feature/splash_screen/screens/splash_screen.dart';
part 'router_delegate.gr.dart';
@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
  ],
)
class AssignmentRouter extends _$AssignmentRouter {}

final AssignmentRouter assignmentRouter = AssignmentRouter();
/*
 * Page name should contain 'Screen' at the end.
 * 'Screen' will replace with 'Route'.
 * Code generation need to run in order to effect the changes
 * TODO: You can run :-
           'flutter packages pub run build_runner build' each time you edit this file
            OR
            'flutter packages pub run build_runner watch' to watch code changes and regenerate

*/
