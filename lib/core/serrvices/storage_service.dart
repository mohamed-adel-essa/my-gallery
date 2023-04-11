import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageKeys {
  StorageKeys();

  //Declare all storage keys here & create its correpsonding setters & getters
  static const String token = "TOKEN";
  static const String activeLocale = "ACTIVE_LOCAL";
}

class StorageService extends GetxService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;

  static Future<StorageService> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return StorageService(prefs);
  }

  //TOKEN
  String? get token {
    return _prefs.getString(StorageKeys.token);
  }

  set token(String? token) {
    if (token != null) {
      _prefs.setString(StorageKeys.token, token);
    }
  }

  //Active Locale
  Locale get activeLocale {
    return const Locale("en");
  }

  set activeLocale(Locale activeLocal) {
    _prefs.setString(StorageKeys.activeLocale, activeLocal.toString());
  }

  clearDataForLogut() {
    _prefs.clear();
  }
}
