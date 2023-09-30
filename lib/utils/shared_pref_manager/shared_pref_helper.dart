import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_app/services/di.dart';

class PreferenceUtils extends ChangeNotifier {
  SharedPreferences? _prefsInstance;

  PreferenceUtils() {
    _init();
  }

  Future<void> _init() async {
    _prefsInstance = await SharedPreferences.getInstance();
    getIt.signalReady(this);
  }

  bool getBool(String key, [bool elseValue = false]) {
    return _prefsInstance?.getBool(key) ?? elseValue;
  }

  Future<bool> setBool(String key, bool value) async {
    return _prefsInstance?.setBool(key, value) ?? Future.value(false);
  }

  Future<String> getString(String key, [String elseValue = '']) async {
    return _prefsInstance?.getString(key) ?? elseValue;
  }

  Future<bool> setString(String key, String value) async {
    return _prefsInstance?.setString(key, value) ?? Future.value(false);
  }
}
