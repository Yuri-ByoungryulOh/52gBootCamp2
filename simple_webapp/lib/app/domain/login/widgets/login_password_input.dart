import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/widgets/click.dart';
import 'package:simple_webapp/app/core/widgets/custom_textfield.dart';

// 비밀번호 표시 처리를 위한 provider
final _isObscureTextProvider = StateProvider<bool>((ref) => true);

// 로그인 패스워드 입력 부분 UI
class LoginPasswortInput extends ConsumerWidget {
  const LoginPasswortInput({
    super.key,
    this.onFieldSubmitted,
    this.onChanged,
    this.suffix,
    this.hintText = '비밀번호',
    this.validators = const [],
    this.controller,
  });

  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final Widget? suffix;
  final String hintText;
  final List<String? Function(String?)> validators;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordObscureText = ref.watch(_isObscureTextProvider);
    return CustomTextfield(
      controller: controller,
      hint: hintText,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      obscureText: isPasswordObscureText,
      suffix: Click(
        onTap: () => ref.read(_isObscureTextProvider.notifier).state = !ref.read(_isObscureTextProvider),
        child: const Icon(Icons.remove_red_eye_outlined, size: 20),
      ),
      validators: validators,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}