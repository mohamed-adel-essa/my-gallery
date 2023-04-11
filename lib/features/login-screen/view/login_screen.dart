import 'package:flutter/material.dart';
import 'package:gallery/core/constants/assets_handler.dart';
import 'package:gallery/features/login-screen/view/widgets/login_form.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          PositionedDirectional(
            top: 10.h,
            start: 35.w,
            child: SizedBox(
              width: 30.w,
              height: 15.h,
              child: const Text("My Gellary ",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fontColor,
                  )),
            ),
          ),
          PositionedDirectional(
              top: 30.h, start: 10.w, child: const Center(child: LoginForm())),
        ],
      ),
    );
  }
}
