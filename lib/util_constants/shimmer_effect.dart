import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectView extends StatelessWidget {
  final Color baseColor;
  final Color highLightColor;
  final Color shimmerColor;
  final Color primaryColor;
  final double? width;
  final double? height;
  final double radius;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;
  final Widget? child;

  const ShimmerEffectView(
      {Key? key,
      this.baseColor = Colors.black87,
      this.highLightColor = Colors.grey,
      this.shimmerColor = Colors.grey,
      this.primaryColor = Colors.grey,
      this.width,
      this.radius = 3,
      this.height,
      this.child,
      this.begin = Alignment.centerLeft,
      this.end = Alignment.centerRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        gradient:
            LinearGradient(begin: begin!, end: end!, colors: [baseColor, highLightColor, primaryColor, shimmerColor]),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(radius)),
        ));
  }
}
