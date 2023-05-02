// ignore_for_file: unused_field

import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _sharedPreferences;

  SharedPreferencesService._();

  static SharedPreferencesService get instance {
    return _instance ?? (_instance = SharedPreferencesService._());
  }

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
