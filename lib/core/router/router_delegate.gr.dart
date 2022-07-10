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
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SignUpScreen(),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    SignInRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SignInScreen(),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: ProductDetailsScreen(key: args.key, product: args.product),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    SeeAllRoute.name: (routeData) {
      final args = routeData.argsAs<SeeAllRouteArgs>(
          orElse: () => const SeeAllRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SeeAllScreen(
              key: args.key, shouldSearchFocus: args.shouldSearchFocus),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          opaque: true,
          barrierDismissible: false);
    },
    CartRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const CartScreen(),
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
        RouteConfig(SignInRoute.name, path: '/sign-in-screen'),
        RouteConfig(ProductDetailsRoute.name, path: '/product-details-screen'),
        RouteConfig(SeeAllRoute.name, path: '/see-all-screen'),
        RouteConfig(CartRoute.name, path: '/cart-screen')
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
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-screen');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-screen');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [ProductDetailsScreen]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({Key? key, required Product product})
      : super(ProductDetailsRoute.name,
            path: '/product-details-screen',
            args: ProductDetailsRouteArgs(key: key, product: product));

  static const String name = 'ProductDetailsRoute';
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.product});

  final Key? key;

  final Product product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [SeeAllScreen]
class SeeAllRoute extends PageRouteInfo<SeeAllRouteArgs> {
  SeeAllRoute({Key? key, bool shouldSearchFocus = false})
      : super(SeeAllRoute.name,
            path: '/see-all-screen',
            args: SeeAllRouteArgs(
                key: key, shouldSearchFocus: shouldSearchFocus));

  static const String name = 'SeeAllRoute';
}

class SeeAllRouteArgs {
  const SeeAllRouteArgs({this.key, this.shouldSearchFocus = false});

  final Key? key;

  final bool shouldSearchFocus;

  @override
  String toString() {
    return 'SeeAllRouteArgs{key: $key, shouldSearchFocus: $shouldSearchFocus}';
  }
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '/cart-screen');

  static const String name = 'CartRoute';
}
