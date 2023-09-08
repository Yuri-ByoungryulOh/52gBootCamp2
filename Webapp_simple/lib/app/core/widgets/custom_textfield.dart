// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_webapp/app/core/style/decoration.dart';
import 'package:simple_webapp/app/core/style/text_style.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class CustomTextfield extends ConsumerStatefulWidget {
  CustomTextfield({
    super.key,
    this.hint,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.validators = const [],
    this.onTap,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText,
    this.borderType,
    this.controller,
    this.maxLines,
    this.textInputAction,
    this.onFieldSubmitted,
  }) {
    focusNode = focusNode ?? FocusNode();
  }

  final String? hint;
  final String? initialValue;
  final Widget? prefix;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final List<String? Function(String?)> validators;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final BorderType? borderType;
  final bool? obscureText;
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  FocusNode? focusNode;

  @override
  ConsumerState<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends ConsumerState<CustomTextfield> {
  final hasFocusProvider = StateProvider<bool>((ref) => false);

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(() {
      if (widget.focusNode?.hasFocus ?? false) {
        ref.read(hasFocusProvider.notifier).state = true;
      } else {
        ref.read(hasFocusProvider.notifier).state = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: _getBorderType(!(widget.controller == null && widget.onChanged == null)),
      child: Row(
        children: [
          widget.prefix ?? const SizedBox.shrink(),
          Expanded(
            child: TextFormField(
              enabled: !(widget.controller == null && widget.onChanged == null),
              maxLines: widget.maxLines ?? 1,
              controller: widget.controller,
              obscureText: widget.obscureText ?? false,
              inputFormatters: widget.inputFormatters ?? [],
              initialValue: widget.initialValue,
              style: TextStyles.s18W400,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              decoration: Decorations.defaultInputDecoration(hint: widget.hint ?? ''),
              textInputAction: widget.textInputAction,
              validator: Validators.compose(widget.validators),
              focusNode: widget.focusNode,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onFieldSubmitted,
            ),
          ),
          widget.suffix ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  Decoration _getBorderType(bool enabled) {
    final hasFocus = ref.watch(hasFocusProvider);
    switch (widget.borderType ?? BorderType.all) {
      case BorderType.all:
        return Decorations.boxDecoration(
          radius: 8,
          bgColor: enabled ? Colors.white : Colors.black12,
          border: hasFocus ? 2 : 1,
          borderColor: hasFocus //
              ? const Color(0xff0091F9)
              : const Color(0xffD9D9D9),
        );
      case BorderType.bottom:
        return Decorations.bottomLineDecoration(
          bgColor: enabled ? Colors.white : Colors.black12,
          border: hasFocus ? 2 : 1,
          borderColor: hasFocus //
              ? const Color(0xff0091F9)
              : const Color(0xffD9D9D9),
        );
    }
  }
}

enum BorderType { bottom, all }
