import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/providers/services_providers.dart';
import 'package:simple_webapp/app/services/app_service.dart';

class LoginController extends ChangeNotifier{
  LoginController(this.ref, this._appService);

  final Ref ref;
  final AppService _appService;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController loginIdTextController = TextEditingController();
  final TextEditingController loginPwTextController = TextEditingController();

  bool isPasswordObscureText = true;
  String redirect = '';
  AutoLoginType autoLoginType = AutoLoginType.none;

  static final provider = ChangeNotifierProvider.autoDispose<LoginController>(
      (ref){
        final appService = ref.read(appServiceProvider);
        return LoginController(ref, appService);
      },
  );

  Future<void> login() async {}
  Future<void> autoLogin(BuildContext context) async {}
  Future<void> setLoginInfo() async {}
  void togglePasswordObscure(){}
  void setLoginTypeRadioValue(AutoLoginType value){}

}