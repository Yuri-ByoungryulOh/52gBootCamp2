// ignore_for_file: must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Click extends StatelessWidget {
  const Click({super.key, required this.child, this.onTap, this.onHover, this.onExit});

  final Widget child;
  final void Function()? onTap;
  final void Function(PointerHoverEvent)? onHover;
  final void Function(PointerExitEvent)? onExit;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: onHover,
      onExit: onExit,
      cursor: (onTap != null) ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap != null ? () => onTap!() : null,
        child: child,
      ),
    );
  }
}
