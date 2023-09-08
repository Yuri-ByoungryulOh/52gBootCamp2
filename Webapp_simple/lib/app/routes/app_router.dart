import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webapp_simple/app/core/widgets/not_found_page.dart';
import 'package:flutter_webapp_simple/app/domain/list_page/item_detail_page.dart';
import 'package:flutter_webapp_simple/app/domain/list_page/item_list_page.dart';
import 'package:flutter_webapp_simple/app/domain/login/login_page.dart';
import 'package:flutter_webapp_simple/app/domain/signup/signup_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_webapp_simple/app/core/constants/app_route_constants.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter(this.ref) {
    router = _getAppRouter();
  }
  final Ref ref;
  late GoRouter router;
  static final provider = Provider<GoRouter>((ref) => AppRouter(ref).router);
  static String initialLocation = AppRouteConstants.login;

  GoRouter _getAppRouter() => GoRouter(
          initialLocation: initialLocation,
          debugLogDiagnostics: true,
          errorBuilder: (context, state) => const NotFoundPage(),
          navigatorKey: navigatorKey,
          routes: [
            GoRoute(
              path: AppRouteConstants.login,
              name: AppRouteConstants.login,
              builder: (context, state) {
                final redirect = state.q['redirect'];
                return LoginPage();
              },
            ),
            GoRoute(
              path: AppRouteConstants.signup,
              name: AppRouteConstants.signup,
              builder: (context, state) => const SignupPage(),
            ),
            GoRoute(
              path: AppRouteConstants.itemList,
              name: AppRouteConstants.itemList,
              builder: (context, state) => const ItemListPage(),
            ),
            GoRoute(
              path: AppRouteConstants.itemDetail,
              name: AppRouteConstants.itemDetail,
              builder: (context, state) => const ItemDetailPage(),
            ),
          ]);
}
