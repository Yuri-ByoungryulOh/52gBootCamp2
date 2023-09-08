import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/constants/app_route_constants.dart';
import 'package:simple_webapp/app/core/data/enums/enums.dart';
import 'package:simple_webapp/app/core/style/decoration.dart';
import 'package:simple_webapp/app/core/style/text_style.dart';
import 'package:simple_webapp/app/core/widgets/click.dart';
import 'package:simple_webapp/app/core/widgets/custom_radio_button.dart';
import 'package:simple_webapp/app/core/widgets/flex_button.dart';
import 'package:simple_webapp/app/domain/login/controller/login_controller.dart';
import 'package:simple_webapp/app/domain/login/widgets/login_id_input.dart';
import 'package:simple_webapp/app/domain/login/widgets/login_password_input.dart';
import 'package:simple_webapp/app/routes/app_router.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

// 로그인 입력 부분 UI
class LoginContents extends ConsumerWidget {
  LoginContents({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(LoginController.provider);

    // Form 위젯은 formKey를 통해 입력값의 유효성 검증을 가능하게 한다
    return Form(
      key: loginController.formKey,
      child: Column(
        children: [
          const SizedBox(height: 40),
          // ID 입력과 패스워드 입력은 서브 위젯으로 분리 하였다
          LoginIdInput(
            controller: loginController.loginIdTextController,
            validators: [
              Validators.required('이메일을 입력해주세요.'),
            ],
          ),
          const SizedBox(height: 8),
          LoginPasswortInput(
            controller: loginController.loginPwTextController,
            onFieldSubmitted: (_) => loginController.login(),
            validators: [
              Validators.required('비밀번호를 입력해주세요.'),
              Validators.patternString(
                r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#^_()%=+--\$&*~]).{8,}$',
                '소/대문자, 숫자, 특수문자를 포함하여 8자 이상 입력해주세요.',
              )
            ],
          ),
          const SizedBox(height: 20),
          // 자동로그인 라디오 버튼 부분
          Row(
            children: [
              CustomRadioButton<AutoLoginType>(
                value: AutoLoginType.seveId,
                groupValue: loginController.autoLoginType,
                onTap: loginController.setLoginTypeRadioValue,
              ),
              const SizedBox(width: 8),
              const Text('아이디 저장', style: TextStyles.s15W400),
              const SizedBox(width: 20),
              CustomRadioButton<AutoLoginType>(
                value: AutoLoginType.autoLogin,
                groupValue: loginController.autoLoginType,
                onTap: loginController.setLoginTypeRadioValue,
              ),
              const SizedBox(width: 8),
              const Text('자동 로그인', style: TextStyles.s15W400),
            ],
          ),
          // ),
          const SizedBox(height: 20),
          // 로그인 버튼
          FlexButton(
            title: '로그인',
            textStyle: TextStyles.s17W700,
            bgColor: const Color(0xff0091F9),
            borderColor: const Color(0xff0091F9),
            onPressed: loginController.login,
          ),
          const SizedBox(height: 20),
          // 회원가입 링크
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Click(
                onTap: () => ref.read(AppRouter.provider).go(AppRouteConstants.signup),
                child: Container(
                  height: 20,
                  decoration: Decorations.bottomLineDecoration(
                    bgColor: Colors.white,
                    borderColor: const Color(0xff979797),
                  ),
                  child: Text('회원가입', style: TextStyles.s12W400.copyWith(color: const Color(0xff888888))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}