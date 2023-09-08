import 'package:flutter/material.dart';

class ContentsFrame extends StatelessWidget {
  const ContentsFrame({
    super.key,
    required this.child,
    this.bottom,
    this.backGroundColor = Colors.white,
    this.appBar,
    this.padding,
    this.floatingActionButton,
    this.constraints = const BoxConstraints(maxWidth: 800),
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  });
  final Widget child;
  final Color? backGroundColor;
  final Widget? bottom;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final Widget? floatingActionButton;
  final BoxConstraints? constraints;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: backGroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Container(
            color: backGroundColor,
            alignment: Alignment.topCenter,
            child: Container(
              color: backGroundColor,
              alignment: Alignment.topCenter,
              padding: padding,
              constraints: constraints,
              child: child,
            ),
          ),
        ),
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
