
import 'package:flutter/material.dart';

class CustomRawScrollBar extends StatelessWidget {
  final ScrollController controller;
  final Widget child;
  final EdgeInsets? padding;
  final double? minthumbLength;
  final Color? color;
  const CustomRawScrollBar(
      {super.key, required this.controller, required this.child, this.padding, this.color, this.minthumbLength});

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
        padding: padding,
        controller: controller,
        trackVisibility: true,
        thumbVisibility: true,
        minThumbLength: minthumbLength ?? _kMinThumbExtent,
        thumbColor: color ?? const Color(0xFFBBBBBC),
        radius: const Radius.circular(30),
        mainAxisMargin: 2.0,
        crossAxisMargin: 2.0,
        child: child);
  }
}

const double _kMinThumbExtent = 18.0;
