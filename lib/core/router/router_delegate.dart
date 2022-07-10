import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../feature/authentication/sign_in/screens/sign_in.dart';
import '../../feature/authentication/signup/screens/signup.dart';
import '../../feature/authentication/signup/screens/welcome.dart';
import '../../feature/home/entity/product.dart';
import '../../feature/home/screens/cart_screen.dart';
import '../../feature/home/screens/home_screen.dart';
import '../../feature/home/screens/product_details_screen.dart';
import '../../feature/home/screens/see_all_screen.dart';
import '../../feature/splash_screen/screens/splash_screen.dart';
part 'router_delegate.gr.dart';
@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    CustomRoute(page: HomeScreen,transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(page: WelcomeScreen,transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(page: SignUpScreen,transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(page: SignInScreen,transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(page: ProductDetailsScreen,transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(page: SeeAllScreen,transitionsBuilder: TransitionsBuilders.slideLeft),
    CustomRoute(page: CartScreen,transitionsBuilder: TransitionsBuilders.slideLeft)
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
