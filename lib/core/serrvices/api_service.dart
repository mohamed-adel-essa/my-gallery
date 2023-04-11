import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery/core/serrvices/storage_service.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/app_endpoints.dart';

class ApiService extends GetxService {
  static final ApiService _apiUtil = ApiService._();
  ApiService._() {
    init();
  }
  factory ApiService() {
    return _apiUtil;
  }

  Dio dio = Dio();

  void init() {
    dio.options.baseUrl = AppEndPoints.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
  }

  Future<Response?> request<T>(String endPoint, String method,
      {dynamic data,
      Map<String, dynamic>? queryParamters,
      String contentType = "application/json",
      String? token}) async {
    try {
      Response response = await dio.request<T>(endPoint,
          data: data ?? {},
          queryParameters: queryParamters,
          options: Options(method: method, headers: {
            "Authorization":
                "Bearer ${token ?? Get.find<StorageService>().token}",
            "Accept-Langugage": "en",
            "Accept": contentType,
          }));

      debugPrint("status: ${response.statusCode}");
      debugPrint("response is : $response");

      if (response.statusCode != 200 && response.statusCode != 201) {
        debugPrint("status: ${response.statusCode}");
        throw "status code error : ${response.statusCode}";
      }

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      debugPrint("Error: $e");
      //@TODO: Add alert dialogue
      return null;
    }
  }
}
