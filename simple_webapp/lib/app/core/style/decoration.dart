import 'package:flutter/material.dart';
import 'package:simple_webapp/app/core/style/text_style.dart';

class Decorations {
  static BoxDecoration boxDecoration({
    required Color bgColor,
    required Color borderColor,
    double? border = 1,
    double? radius = 0,
  }) {
    return BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.all(Radius.circular(radius!)),
      border: Border.all(width: border ?? 1, color: borderColor),
    );
  }

  static BoxDecoration bottomLineDecoration({required Color bgColor, required Color borderColor, double border = 1}) {
    return BoxDecoration(
      color: bgColor,
      border: Border(bottom: BorderSide(width: border, color: borderColor)),
    );
  }

  static InputDecoration defaultInputDecoration({required String hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyles.s18W400.copyWith(color: const Color(0xffA1A1A1)),
      border: InputBorder.none,
    );
  }
}
