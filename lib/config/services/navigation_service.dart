import 'package:flutter/material.dart';
import 'package:weather_app/config/my_app/app_shared.dart';

class N {
  static void init() {
    AppSharedData.navigationKey = GlobalKey();
  }

  static Future<dynamic> offAllNamed(String routeName,
      {Object? arguments}) async {
    return AppSharedData.navigationKey!.currentState!.pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }
   static Future<dynamic> toNamed(String routeName, {Object? arguments}) async {
    return AppSharedData.navigationKey!.currentState!
        .pushNamed(routeName, arguments: arguments);
  }
  static void back<T extends Object>([T? result]) {
    AppSharedData.navigationKey!.currentState!.pop(result);
  }
     static Future<T?> to<T extends Object?>(Route<T>? route) {
    return AppSharedData.navigationKey!.currentState!.push(route!);
  }
}
