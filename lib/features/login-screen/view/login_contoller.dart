import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/helpers/snackbar_helper.dart';
import '../../../core/serrvices/storage_service.dart';
import '../../home-scren/view/home_screen.dart';
import '../data/auth_services.dart';
import '../domin/models/auth_response_model.dart';

class LoginContoller extends GetxController {
  final FocusNode _passwordNode = FocusNode();
  final TextEditingController _mailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool _isLoading = false;

  FocusNode get passwordNode => _passwordNode;
  bool get isLoading => _isLoading;
  TextEditingController get mailTextContoller => _mailTextController;
  TextEditingController get passwordTextController => _passwordTextController;

  toggleLoading() {
    _isLoading = !_isLoading;
    update();
  }

  doLogin(BuildContext context) async {
    if (_mailTextController.text.trim().isNotEmpty &&
        _passwordTextController.text.trim().isNotEmpty) {
      toggleLoading();
      AuthResponseModel? result = await AuthServices.login(
          email: _mailTextController.text.trim(),
          password: _passwordTextController.text.trim());
      toggleLoading();

      if (result == null) {
        SnackBarhelper.showErrorSnackBar(
            error: "Something went wrong please try again.");
      } else {
        if (result.erroMsg == null) {
          Get.find<StorageService>().token = result.token;

          Get.offAll(() => HomeScreen(user: result.user!));
        } else {
          SnackBarhelper.showErrorSnackBar(error: result.erroMsg!);
        }
      }
    } else {
      SnackBarhelper.showErrorSnackBar(error: "please Fill all fields");
    }
  }

  @override
  void dispose() {
    _passwordNode.dispose();
    super.dispose();
  }
}
