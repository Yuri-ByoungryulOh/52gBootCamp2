import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/style/text_style.dart';
import 'package:simple_webapp/app/core/widgets/contents_frame.dart';
import 'package:simple_webapp/app/core/widgets/image_box.dart';
import 'package:simple_webapp/app/domain/login/controller/login_controller.dart';
import 'package:simple_webapp/app/domain/login/widgets/login_contents.dart';

// 로그인 화면은 initState 단계에서 처리할 로직이 있어서
// StatefulWidget을 대신할 riverpod의 ConsumerStatefulWidget을 상속한다
// 나중에 로그인후 이동할 화면 경로를 받기위해 redirect를 파라미터로 받는다
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({this.redirect, super.key});
  final String? redirect;

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

// ref 사용을 위해 ConsumerState riverpod의 위젯을 상속
class _LoginPageState extends ConsumerState<LoginPage> {

  // 파라미터로 받은 redirect Controller에 전달 한다
  // 자동로그인 설정이 되있으면 로그인 조건 화인후 해당 화면으로 이동하기 위함
  @override
  void initState() {
    //Provider 사용
    final loginController = ref.read(LoginController.provider);

    if (widget.redirect != null) {
      loginController.redirect = widget.redirect!;
    }
    loginController.autoLogin(context);
    super.initState();
  }

  // 화면 UI 표현
  @override
  Widget build(BuildContext context) {
    return ContentsFrame(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          const Spacer(flex: 2),
          const ImageBox('assets/images/gs_logo.png', width: 100),
          const SizedBox(height: 18),
          Text(
            '52g Simple WebApp',
            style: TextStyles.s16W700.copyWith(color: const Color(0xff0071BC)),
            textAlign: TextAlign.center,
          ),
          LoginContents(),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}