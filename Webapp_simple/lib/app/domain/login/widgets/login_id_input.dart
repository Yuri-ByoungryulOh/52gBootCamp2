import 'package:flutter/material.dart';
import 'package:flutter_webapp_simple/app/core/widgets/custom_textfield.dart';
import 'package:simple_webapp/app/core/widgets/custom_textfield.dart';

// 로그인 ID 입력 부분 UI
class LoginIdInput extends StatelessWidget {
  const LoginIdInput({
    super.key,
    this.hintText = '아이디',
    this.onChanged,
    this.validators = const [],
    this.controller,
  });

  final String hintText;
  final void Function(String)? onChanged;
  final List<String? Function(String?)> validators;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      controller: controller,
      keyboardType: TextInputType.text,
      hint: hintText,
      onChanged: onChanged,
      validators: validators,
    );
  }
}