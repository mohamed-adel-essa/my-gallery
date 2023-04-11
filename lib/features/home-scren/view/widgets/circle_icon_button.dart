import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton(
      {super.key, this.color, required this.icon, this.height, this.width});
  final Color? color;
  final String icon;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 10.w,
      height: height ?? 4.h,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Image.asset(
        icon,
        width: width ?? 10.w,
        height: height ?? 4.h,
      ),
    );
  }
}
