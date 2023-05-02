import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/config/my_app/app_shared.dart';
import 'package:weather_app/config/routing/app_router.dart';
import 'package:weather_app/features/show_weather/home_page.dart';

import 'my_app_notifier.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Selector<MyAppNotifier, bool>(
      selector: (_, value) => value.nApp,
      builder: (_, nApp, __) => ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          
          navigatorKey: AppSharedData.navigationKey,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: DubaiCityWeather.routeName,
        ),
      ),
    );
  }
}
