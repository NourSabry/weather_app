// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/features/detailed_weather/detailed_weather.dart';
import 'package:weather_app/features/detailed_weather/detailed_weather_notifier.dart';
import 'package:weather_app/features/show_weather/home_page.dart';
import 'package:weather_app/features/show_weather/home_page_notifier.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic args = settings.arguments;

    switch (settings.name) {
      case DubaiCityWeather.routeName:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<HomePageNotifier>(
            create: (_) => HomePageNotifier(),
            child: const DubaiCityWeather(),
          ),
        );
      case DetailedWeatherScreen.routeName:
         return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider<DetailedWeatherNotifier>(
            create: (_) => DetailedWeatherNotifier(
              context: _,
            ),
            child: DetailedWeatherScreen(
              temp: args['temp'],
              time: args['time'],
              desc: args['desc'],
              humidity: args['humidity'],
             ),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }
}
