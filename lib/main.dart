import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/config/my_app/my_app.dart';
import 'package:weather_app/config/my_app/my_app_notifier.dart';
import 'package:weather_app/config/services/start_up.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StartUp.init();
  runApp(
    ChangeNotifierProvider<MyAppNotifier>(
      create: (_) => MyAppNotifier(),
      child: const MyApp(),
    ),
  );
}
