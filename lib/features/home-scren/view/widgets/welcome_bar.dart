import 'package:flutter/material.dart';
import 'package:gallery/core/constants/app_colors.dart';
import 'package:gallery/features/login-screen/domin/models/user_model.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/assets_handler.dart';

class WelcomeBar extends StatelessWidget with PreferredSizeWidget {
  const WelcomeBar({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Welcome",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fontColor,
                  )),
              Text(user.name!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.fontColor,
                  )),
            ],
          ),
          const Spacer(),
          Container(
              width: 20.w,
              height: 30.h,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(AssetsHandler.avatarImage))))
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(25.h);
}
