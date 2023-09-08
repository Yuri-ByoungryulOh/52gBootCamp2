import 'package:flutter/material.dart';
import 'package:simple_webapp/app/core/style/decoration.dart';
import 'package:simple_webapp/app/core/widgets/click.dart';

class FlexButton extends StatelessWidget {
  const FlexButton({
    super.key,
    required this.title,
    this.padding = const EdgeInsets.fromLTRB(15, 5, 15, 5),
    this.titleColor = Colors.white,
    required this.textStyle,
    required this.bgColor,
    required this.borderColor,
    this.onPressed,
    this.height = 52,
    this.radius = 8,
    this.border = 1,
  });
  final void Function()? onPressed;
  final Color bgColor;
  final Color borderColor;
  final Color titleColor;
  final String title;
  final double radius;
  final double height;
  final double border;
  final EdgeInsetsGeometry padding;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Click(
      onTap: onPressed,
      child: Container(
        padding: padding,
        height: height,
        alignment: Alignment.center,
        decoration:
            Decorations.boxDecoration(bgColor: bgColor, borderColor: borderColor, radius: radius, border: border),
        child: Text(
          title,
          style: textStyle.copyWith(color: titleColor),
        ),
      ),
    );
  }
}
