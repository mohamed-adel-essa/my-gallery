import 'package:flutter/material.dart';
import 'package:gallery/core/constants/app_colors.dart';
import 'package:gallery/core/shared-widgets/loader.dart';
import 'package:gallery/features/home-scren/view/home_contoller.dart';
import 'package:gallery/features/home-scren/view/widgets/actions_bar.dart';
import 'package:gallery/features/home-scren/view/widgets/gallery_images.dart';
import 'package:gallery/features/home-scren/view/widgets/welcome_bar.dart';
import 'package:get/get.dart';

import '../../../core/shared-widgets/app_background.dart';
import '../../login-screen/domin/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.user});
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeContoller>(
      init: HomeContoller(user),
      builder: (homeContoller) {
        return Scaffold(
          body: AppBackGround(
            child: RefreshIndicator(
              onRefresh: () => Get.find<HomeContoller>().getUserImages(),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.lightBgColor,
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    WelcomeBar(user: user!),
                    const ActionsBar(),
                    homeContoller.isLoading
                        ? Center(child: Loader(color: AppColors.primaryColor))
                        : GalleryImages(imags: homeContoller.images),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
