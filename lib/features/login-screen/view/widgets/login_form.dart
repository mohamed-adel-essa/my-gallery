import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/assets_handler.dart';
import '../../../../core/shared-widgets/loader.dart';
import '../../../../core/shared-widgets/textfield/custom_button.dart';
import '../../../../core/shared-widgets/textfield/custom_password_textfield.dart';
import '../../../../core/shared-widgets/textfield/custom_textfield.dart';
import '../login_contoller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginContoller>(
        init: LoginContoller(),
        builder: (loginContoller) {
          return Container(
            width: 80.w,
            height: 45.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(AssetsHandler.formBg),
                  fit: BoxFit.contain,
                ),
                borderRadius: BorderRadius.circular(30),
                color: AppColors.lightBgColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Log in",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.fontColor,
                    )),
                CustomTextField(
                  controller: loginContoller.mailTextContoller,
                  hintText: "User Name",
                  validatorMessage: "*required",
                  isValidator: true,
                  fillColor: AppColors.whiteColor,
                  nextNode: loginContoller.passwordNode,
                  textInputType: TextInputType.emailAddress,
                ),
                CustomPasswordTextField(
                  controller: loginContoller.passwordTextController,
                  fillColor: AppColors.whiteColor,
                  hintTxt: "Password",
                ),
                CustomButton(
                  onTap: () => loginContoller.doLogin(context),
                  title: "Submit",
                  radius: 10,
                  size: Size(80.w, 7.h),
                  child: loginContoller.isLoading
                      ? Loader(color: AppColors.whiteColor)
                      : null,
                ),
              ],
            ),
          );
        });
  }
}
