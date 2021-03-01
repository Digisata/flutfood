import 'package:flutter/material.dart';

class ScrollBodyWidget extends StatelessWidget {
  const ScrollBodyWidget({
    @required this.body,
    Key key,
    this.isSafeTop = true,
    this.isSafeBottom = true,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  final bool isSafeTop, isSafeBottom;
  final EdgeInsets padding;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: isSafeTop,
      bottom: isSafeBottom,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: padding,
        child: body,
      ),
    );
  }
}
