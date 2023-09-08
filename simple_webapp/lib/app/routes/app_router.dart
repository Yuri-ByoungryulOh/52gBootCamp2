// lib/app/routes/app_router.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_webapp/app/core/api/user/user_api.dart';
import 'package:simple_webapp/app/core/constants/app_route_constants.dart';
import 'package:simple_webapp/app/core/providers/services_providers.dart';
import 'package:simple_webapp/app/core/services/app_service.dart';
import 'package:simple_webapp/app/core/widgets/not_found_page.dart';
import 'package:simple_webapp/app/domain/list_page/item_detail_page.dart';
import 'package:simple_webapp/app/domain/list_page/item_list_page.dart';
import 'package:simple_webapp/app/domain/login/login_page.dart';
import 'package:simple_webapp/app/domain/signup/signup_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter(this.ref) {
    router = _getAppRouter();
  }
  final Ref ref;
  late GoRouter router;
  static final provider = Provider<GoRouter>((ref) => AppRouter(ref).router);

  static String initialLocation = AppRouteConstants.login;

  Future<void> setLoginUserInfo(Ref ref) async {
    final appService = ref.read(appServiceProvider);
    if (appService.secureStorageService.accessToken.isNotEmpty &&
        appService.secureStorageService.loginedUserId.isNotEmpty) {
      appService.loginUser =
      await ref.read(UserApi.provider).getUser(email: appService.secureStorageService.loginedUserId);
    }
  }

  GoRouter _getAppRouter() => GoRouter(
    initialLocation: initialLocation,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => const NotFoundPage(),
    navigatorKey: navigatorKey,
    redirect: (BuildContext context, GoRouterState state) async {
      // 여기서 middleware 처리 (로깅, 로그인 redirect)
      final appService = ref.read(appServiceProvider);

      //Storage에 토큰이 있다면 사용자 정보를 백앤드에서 받아와 세팅한다.(새로고침시 로그아웃 방지)
      if (!appService.isLogin) {
        await setLoginUserInfo(ref);
      }

      // 미 로그인 redirect
      return unLoginRedirect(appService: appService, state: state);
    },
    routes: [
      GoRoute(
        path: AppRouteConstants.login,
        name: AppRouteConstants.login,
        builder: (context, state) {
          final redirect = state.uri.queryParameters['redirect'];
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
    ],
  );
  String? unLoginRedirect({
    required AppService appService,
    required GoRouterState state,
  }) {
    if ([
      AppRouteConstants.itemList,
      AppRouteConstants.itemDetail,
    ].contains((state.uri.toString()).split('?').first)) {
      if (!appService.isLogin) {
        return "${AppRouteConstants.login}?redirect=${state.uri.toString().replaceAll('&', '%26')}";
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}