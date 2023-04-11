import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/assets_handler.dart';

class AppBackGround extends StatelessWidget {
  const AppBackGround({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
          ),
          PositionedDirectional(
            top: 10.h,
            end: 50.w,
            child: RotatedBox(
                quarterTurns: 1, child: Image.asset(AssetsHandler.ellipsPink)),
          ),
          PositionedDirectional(
            top: -10.h,
            start: 10.w,
            child: Image.asset(AssetsHandler.ellipsBlue),
          ),
          child,
        ],
      ),
    );
  }
}
