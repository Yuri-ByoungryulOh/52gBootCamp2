import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webapp_simple/app/core/style/text_style.dart';
import 'package:flutter_webapp_simple/app/core/widgets/contents_frame.dart';
import 'package:flutter_webapp_simple/app/core/widgets/image_box.dart';
import 'package:flutter_webapp_simple/app/domain/login/controller/login_controller.dart';
import 'package:flutter_webapp_simple/app/domain/login/widgets/login_contents.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key, this.redirect});

  final String? redirect;

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    final loginController = ref.read(LoginController.provider);

    if (widget.redirect != null) {
      loginController.redirect = widget.redirect!;
    }
    loginController.autoLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ContentsFrame(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          children: [
            const Spacer(flex: 2),
            const ImageBox('assets/image/gs_logo.png', width: 100),
            const SizedBox(height: 10),
            Text(
              '52g Simple WebApp',
              style:
                  TextStyles.s16W700.copyWith(color: const Color(0xff0071BC)),
              textAlign: TextAlign.center,
            ),
            LoginContents(),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
            const Spacer(flex: 3),
          ],
        ));
  }
}
