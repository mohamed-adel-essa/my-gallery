import 'package:flutter/services.dart';

class ValidationHelper {
  static bool isNullOrEmpty(String? val) {
    if (val == null || val == null.toString()) {
      return true;
    } else if (val.trimRight().trimLeft() == '') {
      return true;
    } else {
      return false;
    }
  }

  static bool isEmailValid(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  static List<TextInputFormatter> denyEmojiInputField() {
    return [
      FilteringTextInputFormatter.deny(
        RegExp(
            r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
      ),
    ];
  }
}
