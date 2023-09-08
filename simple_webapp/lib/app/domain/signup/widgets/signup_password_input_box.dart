// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/utils/dialog_utils.dart';
import 'package:simple_webapp/app/core/widgets/custom_textfield.dart';
import 'package:simple_webapp/app/domain/signup/controller/signup_controller.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

// 두 번의 패스워드 입력을 받아 비교하고 SignupController newUser 에 저장한다
class SignupPasswordInputBox extends ConsumerWidget {
  SignupPasswordInputBox({super.key});
  String inputPassword = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupController = ref.watch(SignupController.provider);
    return Column(
      children: [
        CustomTextfield(
          hint: '비밀번호 입력',
          borderType: BorderType.all,
          keyboardType: TextInputType.phone,
          obscureText: true,
          validators: [
            Validators.required('비밀번호를 입력하세요.'),
            Validators.patternString(
              r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#^_()%=+--\$&*~]).{8,}$',
              '소/대문자, 숫자, 특수문자를 포함하여 8자 이상 입력해주세요.',
            )
          ],
          onChanged: (value) {
            inputPassword = value;
          },
        ),
        const SizedBox(height: 10),
        CustomTextfield(
          hint: '비밀번호 확인',
          borderType: BorderType.all,
          keyboardType: TextInputType.phone,
          obscureText: true,
          validators: [
            Validators.required('비밀번호를 입력하세요.'),
            Validators.patternString(
              r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#^_()%=+--\$&*~]).{8,}$',
              '소/대문자, 숫자, 특수문자를 포함하여 8자 이상 입력해주세요.',
            )
          ],
          onChanged: (value) {
            if (value.length == inputPassword.length) {
              if (value == inputPassword) {
                signupController.newUser = signupController.newUser.copyWith(password: value);
              } else {
                showCustomAlert(title: '비밀번호가 다릅니다.');
              }
            }
          },
        ),
      ],
    );
  }
}