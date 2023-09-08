import 'package:flutter/material.dart';
import 'package:simple_webapp/app/core/style/decoration.dart';
import 'package:simple_webapp/app/core/style/text_style.dart';
import 'package:simple_webapp/app/core/widgets/click.dart';
import 'package:simple_webapp/app/routes/app_router.dart';

Future<dynamic> showCustomAlert({
  required String title,
  String? desc,
  Widget? topIcon,
  String actionText = '확인',
  String cancelActionText = '취소',
  void Function()? action,
  void Function()? cancelAction,
}) async {
  return showDialog<void>(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    barrierLabel: '',
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              topIcon ?? const SizedBox(),
              SizedBox(height: (topIcon != null) ? 20 : 10),
              Text(title, style: TextStyles.s20W700),
              const SizedBox(height: 12),
              if (desc != null)
                Text(desc, style: TextStyles.s15W400.copyWith(color: const Color(0xff696969)))
              else
                const SizedBox.shrink(),
              const SizedBox(height: 12),
              Row(
                children: [
                  if (cancelAction != null)
                    Expanded(
                      child: Click(
                        onTap: () async {
                          Navigator.pop(context);
                          cancelAction();
                        },
                        child: Container(
                          decoration: Decorations.boxDecoration(
                            bgColor: Colors.white,
                            borderColor: const Color(0xffDADADA),
                            radius: 10,
                          ),
                          height: 48,
                          alignment: Alignment.center,
                          child: Text(
                            cancelActionText,
                            style: TextStyles.s17W700.copyWith(color: const Color(0xff696969)),
                          ),
                        ),
                      ),
                    ),
                  if (cancelAction != null) const SizedBox(width: 12),
                  Expanded(
                    child: Click(
                      onTap: () async {
                        Navigator.pop(context);
                        if (action != null) action();
                      },
                      child: Container(
                        decoration: Decorations.boxDecoration(
                          bgColor: const Color(0xff0091f9),
                          borderColor: const Color(0xff0091f9),
                          radius: 10,
                        ),
                        height: 48,
                        alignment: Alignment.center,
                        child: Text(actionText, style: TextStyles.s17W700.copyWith(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
