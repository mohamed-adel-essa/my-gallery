import 'package:gallery/core/helpers/snackbar_helper.dart';
import 'package:gallery/features/home-scren/domin/models/gallery_response_model.dart';
import 'package:gallery/features/login-screen/domin/models/user_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/serrvices/success_response.dart';
import '../data/gallery_services.dart';

class HomeContoller extends GetxController {
  HomeContoller(this.user);
  UserModel? user;
  List<String> _galleryImages = [];
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  List<String> get images => _galleryImages;

  toggleLoading() {
    _isLoading = !_isLoading;
    update();
  }

  @override
  void onInit() {
    getUserImages();
    super.onInit();
  }

  Future getUserImages() async {
    _isLoading = true;
    update();
    GalleryResponseModel? galleryResponseModel =
        await GallaryServices.getUserImages();
    if (galleryResponseModel != null) {
      _galleryImages = (galleryResponseModel.images!.images ?? []);
    }

    _isLoading = false;
    update();
  }

  uploadNewImage(XFile image) async {
    var response = await GallaryServices.uploadNewImage(image: image);
    Get.back();
    if (response is SuccessResponse) {
      SnackBarhelper.showSuccessSnackBar(msg: response.message!);
      getUserImages();
    } else {
      SnackBarhelper.showErrorSnackBar(error: response.message!);
    }
  }
}
