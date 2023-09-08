import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_webapp/app/core/constants/api_constants.dart';
import 'package:simple_webapp/app/core/constants/app_route_constants.dart';
import 'package:simple_webapp/app/core/services/app_service.dart';
import 'package:simple_webapp/app/core/utils/dialog_utils.dart';

class DioService {
  DioService(this._appService) {
    dio.interceptors.addAll(<Interceptor>[DioInterceptors(_appService)]);
    dio.httpClientAdapter = BrowserHttpClientAdapter();
  }

  final AppService _appService;

  late Dio dio = Dio(
    _appService.secureStorageService.accessToken.isNotEmpty
        ? options.copyWith(headers: {'Authorization': 'Bearer ${_appService.secureStorageService.accessToken}'})
        : options,
  );

  BaseOptions options = BaseOptions(
    baseUrl: ApiConstant.baseUrl,
    connectTimeout: const Duration(seconds: 7),
    receiveTimeout: const Duration(seconds: 5),
  );

  void setAccessToken() {
    dio.options = dio.options.copyWith(
      headers: {'Authorization': 'Bearer ${_appService.secureStorageService.accessToken}'},
    );
  }

  void clearAccessToken() {
    dio.options = dio.options.copyWith(
      headers: {},
    );
  }
}

class DioInterceptors extends Interceptor {
  DioInterceptors(this.appService);
  final AppService appService;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => URI: ${options.uri}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    debugPrint('RESPONSE[${response.statusCode}] ');
    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.uri}');
    debugPrint('ERROR[${err.response?.data}]');

    if ((err.response?.statusCode ?? 0) == 401) {
      showCustomAlert(
        title: "로그인이 필요합니다.",
        action: () async {
          await appService.secureStorageService.deleteAll();
          appService.appRouter.go(AppRouteConstants.login);
        },
      );
    }

    return super.onError(err, handler);
  }
}