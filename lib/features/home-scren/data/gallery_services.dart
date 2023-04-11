import 'package:dio/dio.dart';
import 'package:gallery/core/serrvices/fail_response.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/app_endpoints.dart';
import '../../../core/serrvices/api_service.dart';
import 'package:dio/dio.dart' as dio;

import '../../../core/serrvices/success_response.dart';
import '../domin/models/gallery_response_model.dart';

class GallaryServices {
  static Future<GalleryResponseModel?> getUserImages() async {
    dio.Response? response = await ApiService().request(
      AppEndPoints.myGallery,
      "GET",
    );

    if (response == null || response.statusCode != 200) {
      return null;
    } else {
      return GalleryResponseModel.fromJson(response.data);
    }
  }

  static Future uploadNewImage({required XFile image}) async {
    dio.Response? response = await ApiService().request(
      AppEndPoints.uploadImage,
      "POST",
      data: dio.FormData.fromMap({
        "img": await MultipartFile.fromFile(image.path),
      }),
    );

    if (response != null && response.statusCode == 200) {
      return SuccessResponse.fromJson(response.data);
    } else {
      return FailResponse.fromJson(response!.data);
    }
  }
}
