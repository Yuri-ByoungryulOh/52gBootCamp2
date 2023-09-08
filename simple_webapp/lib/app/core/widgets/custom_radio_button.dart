import 'package:flutter/material.dart';
import 'package:simple_webapp/app/core/style/decoration.dart';
import 'package:simple_webapp/app/core/widgets/click.dart';

class CustomRadioButton<T> extends StatelessWidget {
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.onTap,
    this.groupValue,
  });

  final T value;
  final T? groupValue;
  final void Function(T) onTap;

  bool get isSelected => groupValue == value;

  @override
  Widget build(BuildContext context) {
    return Click(
      onTap: () => onTap(value),
      child: Container(
        width: 22,
        height: 22,
        decoration: Decorations.boxDecoration(
          radius: 11,
          border: isSelected ? 6 : 1,
          bgColor: Colors.transparent,
          borderColor: isSelected ? const Color(0xff0091F9) : const Color(0xffDADADA),
        ),
      ),
    );
  }
}
