import 'package:base_project/core/routes/route_name.dart';
import 'package:base_project/features/auth/view/otp_screen/otp_screen.dart';
import 'package:base_project/features/auth/view/signin_screen/signin_screen.dart';
import 'package:base_project/features/cart/view/cart_screen.dart';
import 'package:base_project/features/cart/view/checkout.dart';
import 'package:base_project/features/cart/view/locationscreen.dart';
import 'package:base_project/features/dashboard/view/screens/dashboard_screen.dart';
import 'package:base_project/features/products/model/product_model.dart';
import 'package:base_project/features/products/view/product_details/product_details__screen.dart';
import 'package:base_project/features/products/view/screen/product_screen.dart';
import 'package:base_project/features/search/search.dart';
import 'package:base_project/features/settings/screens/faq_screen.dart';
import 'package:base_project/features/settings/screens/settings.dart';
import 'package:base_project/features/splash/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigateFirstPagr = GlobalKey<NavigatorState>(debugLabel: 'name');
final _shellNavigatorNotificationSecondPage =
    GlobalKey<NavigatorState>(debugLabel: 'name');
final _shellNavigatorNotificationthirdPage =
    GlobalKey<NavigatorState>(debugLabel: 'name');

final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      navigatorKey: _rootNavigatorKey,
      redirect: (context, state) {
        print("Current Route: ${state.matchedLocation}");

        if (state.matchedLocation == Routes.splashRoute) {
          return Routes.splashRoute;
        }

        print("Final Route after redirection: ${state.matchedLocation}");

        return null;
      },
      initialLocation: Routes.splashRoute,
      routes: [
        GoRoute(
          path: Routes.splashRoute,
          name: NameRoutes.splashNameRoute,
          pageBuilder: (context, state) {
            return const NoTransitionPage(child: SplashScreen());
          },
        ),

        GoRoute(
          path: Routes.logintRoute,
          name: NameRoutes.loginNameRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: LoginScreen());
          },
        ),

        GoRoute(
          path: Routes.otpRoute,
          name: NameRoutes.otpNameRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: OtpScreen());
          },
        ),

        GoRoute(
          path: Routes.productDetailRoute,
          name: NameRoutes.productDetailNameRoute,
          pageBuilder: (context, state) {
            final product = state.extra as ProductModel;
            return NoTransitionPage(
              child: ProductDetailsScreen(product: product),
            );
          },
        ),
        GoRoute(
          path: Routes.cartRoute,
          name: NameRoutes.cartNameRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: CartScreen());
          },
        ),
        GoRoute(
          path: Routes.faqRoute,
          name: NameRoutes.faqNameRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: FAQScreen());
          },
        ),
        GoRoute(
            path: Routes.checkoutRoute,
            name: NameRoutes.checkoutNameRoute,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: CheckoutPage());
            }),

        GoRoute(
            path: Routes.locationRoute,
            name: NameRoutes.locationNameRoute,
            pageBuilder: (context, state) {
              return NoTransitionPage(child: SelectMapLocation());
            }),
        // SHELL NAVIGATOR

        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return DashBoardScreen(navigatorShellKey: navigationShell);
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              navigatorKey: _shellNavigateFirstPagr,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.productRoute,
                  name: NameRoutes.productNameRoute,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: ProductScreen());
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorNotificationSecondPage,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.searchRoute,
                  name: NameRoutes.searchNameRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: SearchScreen());
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _shellNavigatorNotificationthirdPage,
              routes: <RouteBase>[
                GoRoute(
                  path: Routes.settingsRoute,
                  name: NameRoutes.settingsNameRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(child: SettingsScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ]);
});
