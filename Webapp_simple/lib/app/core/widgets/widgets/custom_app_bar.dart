import 'package:flutter/material.dart';
import 'package:simple_webapp/app/core/style/decoration.dart';
import 'package:simple_webapp/app/core/style/text_style.dart';
import 'package:simple_webapp/app/core/widgets/click.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leftWidget,
    this.leftWidgetOnTap,
    this.rightWidget,
    this.rightWidgetOnTap,
  }) : assert(title != null || titleWidget != null, 'title 혹은 titleWidget을 지정해야 합니다.');

  final String? title;
  final Widget? titleWidget;
  final Widget? leftWidget;
  final void Function()? leftWidgetOnTap;
  final Widget? rightWidget;
  final void Function()? rightWidgetOnTap;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.bottomLineDecoration(bgColor: Colors.white, borderColor: const Color(0xffEEEEEE)),
      alignment: Alignment.center,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          titleWidget ?? Text(title ?? '', style: TextStyles.s22W700),
          Row(
            children: [
              const SizedBox(width: 12),
              if (leftWidget != null) Click(onTap: leftWidgetOnTap, child: leftWidget!) else const SizedBox.shrink(),
              const Spacer(),
              if (rightWidget != null) Click(onTap: rightWidgetOnTap, child: rightWidget!) else const SizedBox.shrink(),
              const SizedBox(width: 18),
            ],
          ),
        ],
      ),
    );
  }
}
