import 'package:dio/dio.dart' as dio;
import 'package:gallery/core/constants/app_endpoints.dart';
import 'package:gallery/core/serrvices/api_service.dart';

import '../domin/models/auth_response_model.dart';

class AuthServices {
  static Future<AuthResponseModel?> login(
      {required String email, required String password}) async {
    dio.Response? response = await ApiService().request(
        AppEndPoints.login, "POST",
        data: {"email": email, "password": password});

    if (response == null || response.statusCode != 200) {
      return null;
    } else {
      return AuthResponseModel.fromJson(response.data);
    }
  }
}
