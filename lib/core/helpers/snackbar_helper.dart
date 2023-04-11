import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarhelper {
  static showErrorSnackBar({required String error, int? seconds}) {
    ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        duration: Duration(seconds: seconds ?? 1),
        backgroundColor: Colors.red,
        content: Text(
          error,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static showSuccessSnackBar({required String msg}) {
    ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
