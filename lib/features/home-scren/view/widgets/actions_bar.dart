import 'package:flutter/material.dart';
import 'package:gallery/core/constants/app_colors.dart';
import 'package:gallery/core/helpers/snackbar_helper.dart';
import 'package:gallery/core/shared-widgets/textfield/custom_button.dart';
import 'package:gallery/features/home-scren/view/widgets/circle_icon_button.dart';
import 'package:gallery/features/login-screen/view/login_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/assets_handler.dart';
import '../../../../core/helpers/image_piceker_helper.dart';
import '../../../../core/serrvices/storage_service.dart';
import '../home_contoller.dart';

class ActionsBar extends StatelessWidget {
  const ActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 7.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
            onTap: () {
              Get.find<StorageService>().clearDataForLogut();
              Get.offAll(() => const LoginScreen());
            },
            title: "Log out",
            radius: 20,
            size: Size(45.w, 7.h),
            color: AppColors.whiteColor,
            child: Row(
              children: const [
                CircleIconButton(
                    color: AppColors.redColor, icon: AssetsHandler.arrowIcon),
                Spacer(),
                Text(
                  "log out",
                  style: TextStyle(
                      color: AppColors.fontColor, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          CustomButton(
            onTap: () => _showAlertDialog(context),
            title: "upload",
            radius: 30,
            size: Size(45.w, 7.h),
            color: AppColors.whiteColor,
            child: Row(
              children: const [
                CircleIconButton(
                    color: AppColors.goldenColor,
                    icon: AssetsHandler.upArrowIcon),
                Spacer(),
                Text(
                  "upload",
                  style: TextStyle(color: AppColors.fontColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        content: Material(
          color: Colors.transparent,
          child: SizedBox(
            height: 20.h,
            child: Column(
              children: [
                CustomButton(
                  onTap: () async {
                    XFile? selectedImage =
                        await ImagePickerHelper.pickImageFromGalley();
                    if (selectedImage != null) {
                      Get.find<HomeContoller>().uploadNewImage(selectedImage);
                    } else {
                      SnackBarhelper.showErrorSnackBar(
                          error: "NO Image Selected");
                    }
                  },
                  title: "Gallery",
                  radius: 30,
                  size: Size(50.w, 7.h),
                  color: AppColors.burbleColor,
                  child: Row(
                    children: [
                      const Spacer(flex: 1),
                      CircleIconButton(
                          height: 6.h,
                          width: 15.w,
                          icon: AssetsHandler.galleryIcon),
                      const Spacer(flex: 2),
                      const Text(
                        "Gallery",
                        style: TextStyle(color: AppColors.fontColor),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
                const Spacer(),
                CustomButton(
                  onTap: () async {
                    XFile? selectedImage =
                        await ImagePickerHelper.pickImageFromCamera();
                    if (selectedImage != null) {
                      Get.find<HomeContoller>().uploadNewImage(selectedImage);
                    } else {
                      SnackBarhelper.showErrorSnackBar(
                          error: "NO Image Selected");
                    }
                  },
                  title: "Camera",
                  radius: 30,
                  size: Size(50.w, 7.h),
                  color: AppColors.burbleColor,
                  child: Row(
                    children: [
                      const Spacer(flex: 1),
                      CircleIconButton(
                          icon: AssetsHandler.camerIcon,
                          height: 6.h,
                          width: 15.w),
                      const Spacer(flex: 2),
                      const Text(
                        "Camera",
                        style: TextStyle(color: AppColors.fontColor),
                      ),
                      const Spacer(flex: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
