import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/config/services/navigation_service.dart';
import 'package:weather_app/config/services/shared_preferences.dart';


class StartUp {
  // init.
  static Future<void> init() async {
     SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
    );

    // init shared preferences service.
    await SharedPreferencesService.init();

    // init navigation service.
    N.init();
  }
}
