import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/api/user/user_api.dart';
import 'package:simple_webapp/app/core/constants/app_route_constants.dart';
import 'package:simple_webapp/app/core/constants/common_constants.dart';
import 'package:simple_webapp/app/core/data/enums/enums.dart';
import 'package:simple_webapp/app/core/providers/services_providers.dart';
import 'package:simple_webapp/app/core/services/app_service.dart';
import 'package:simple_webapp/app/routes/app_router.dart';

class LoginController extends ChangeNotifier {
  LoginController(this.ref, this._appService, this._userApi);

  final Ref ref;
  final AppService _appService;
  final UserApi _userApi;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginIdTextController = TextEditingController();
  final TextEditingController loginPwTextController = TextEditingController();

  bool isPasswordObscureText = true;
  String redirect = '';
  AutoLoginType autoLoginType = AutoLoginType.none;

  // Provider 선언
  static final provider = ChangeNotifierProvider.autoDispose<LoginController>(
    (ref) {
      final appService = ref.read(appServiceProvider);
      final userApi = ref.read(UserApi.provider);
      return LoginController(ref, appService, userApi);
    },
  );

  // 로그인 처리
  Future<void> login() async {
// formKey.currentState?.validate() 를 통해 입력값에 사정 정의된 규칙에 맞는지 확인이 가능하다
    // 텍스트 필드의 validators 부분에 정의된 큐직을 통과하면 true 이다
    if (formKey.currentState?.validate() ?? false) {
      // _userApi.postSignin 를 통하여 아이디와 비밀번호를 서버로 전송한다
      // 결과 값으로 UserModel 을 받고 _appService.loginUser 에 저장한다
      _appService.loginUser = await _userApi.postSignin(
        email: loginIdTextController.text,
        password: loginPwTextController.text,
      );

      // _userApi.postSignin 으로 받는 User의 값은 일부 값만 받아오기 때문에 다시 한번 _userApi.getUser 를 통해
      // 전체 값을 받아온다.
      _appService.loginUser =
          await _userApi.getUser(email: _appService.loginUser.email);

      // 자동로그인 설정에 따라 로그인 정보를 저장한다
      if ((_appService.loginUser.email).isNotEmpty) {
        switch (autoLoginType) {
          case AutoLoginType.none:
            await _appService.secureStorageService
                .delete(CommonConstants.loginId);
            await _appService.secureStorageService
                .delete(CommonConstants.autoLoginTypeKey);
            break;
          case AutoLoginType.seveId:
            await _appService.secureStorageService.write(
                key: CommonConstants.loginId,
                value: loginIdTextController.text);
            await _appService.secureStorageService.write(
                key: CommonConstants.autoLoginTypeKey,
                value: autoLoginType.name);
            break;
          case AutoLoginType.autoLogin:
            await _appService.secureStorageService.write(
                key: CommonConstants.loginId,
                value: loginIdTextController.text);
            await _appService.secureStorageService.write(
                key: CommonConstants.autoLoginTypeKey,
                value: autoLoginType.name);
            break;
        }

        // 로그인 정보를 초기화하고 화면을 이동한다
        loginIdTextController.text = '';
        loginPwTextController.text = '';

        // redirect 값이 있으면 해당 화면으로 이동한다
        if (redirect.isNotEmpty) {
          _appService.appRouter.go(redirect);
        } else {
          ref.read(AppRouter.provider).go(AppRouteConstants.itemList);
        }
      }
    }
  }

// 로그인 화면 로딩시 호출되며, 자동로그인 설정이 되어 있고 token이 있다면 User 정보를 얻어 목록 화면으로 이동 한다
  Future<void> autoLogin(BuildContext context) async {
    await setLoginInfo();
    if (autoLoginType == AutoLoginType.autoLogin) {
      if (loginIdTextController.text.isNotEmpty && loginPwTextController.text.isNotEmpty) {
        _appService.loginUser = await _userApi.getUser(email: _appService.loginUser.email);
        if (redirect.isNotEmpty) {
          _appService.appRouter.go(redirect);
        } else {
          ref.read(AppRouter.provider).go(AppRouteConstants.itemList);
        }
      }
    }
  }

  // autoLogin 에서 호출되고 자동로그인 설정이 되어있는지 local storage 확인하고 필요한 값을 세팅한다
  Future<void> setLoginInfo() async {
    loginIdTextController.text = await _appService.secureStorageService.read(key: CommonConstants.loginId) ?? '';
    autoLoginType = AutoLoginType.getByName(
      await _appService.secureStorageService.read(key: CommonConstants.autoLoginTypeKey) ?? 'none',
    );

    // 화면갱신
    notifyListeners();
  }


  // 비밀번호 표시 여부를 변경한다
  void togglePasswordObscure() {
    isPasswordObscureText = !isPasswordObscureText;
  }


  // 자동로그인 설정을 변경한다
  void setLoginTypeRadioValue(AutoLoginType value) {
    if (autoLoginType == value) {
      autoLoginType = AutoLoginType.none;
    } else {
      autoLoginType = value;
    }
    notifyListeners();
  }



}
