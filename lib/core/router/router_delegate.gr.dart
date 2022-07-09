// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router_delegate.dart';

class _$AssignmentRouter extends RootStackRouter {
  _$AssignmentRouter([GlobalKey<NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashScreen());
    },
    HomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const HomeScreen(),
          transitionsBuilder: TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    WelcomeRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const WelcomeScreen(),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SignUpScreen(key: args.key),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SignInScreen(key: args.key),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/home-screen'),
        RouteConfig(WelcomeRoute.name, path: '/welcome-screen'),
        RouteConfig(SignUpRoute.name, path: '/sign-up-screen'),
        RouteConfig(SignInRoute.name, path: '/sign-in-screen')
      ];
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-screen');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute() : super(WelcomeRoute.name, path: '/welcome-screen');

  static const String name = 'WelcomeRoute';
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({dynamic key})
      : super(SignUpRoute.name,
            path: '/sign-up-screen', args: SignUpRouteArgs(key: key));

  static const String name = 'SignUpRoute';
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final dynamic key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({dynamic key})
      : super(SignInRoute.name,
            path: '/sign-in-screen', args: SignInRouteArgs(key: key));

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final dynamic key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}
