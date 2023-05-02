// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/config/constants/api.dart';
import 'package:weather_app/models/current_weather.dart' as current;
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class HomePageNotifier with ChangeNotifier {
  final _apiServices = ApiServices.weatherApi + ApiServices.apiKey;
  final _apiServicesCurrent = ApiServices.currentWeather + ApiServices.apiKey;


  void init() async {
    await Future.delayed(const Duration(milliseconds: 200));
     getFiveDaysThreeHoursForcastData();
  }
  Future<List<ListElement>> getFiveDaysThreeHoursForcastData() async {
    final response = await http.Client().get(Uri.parse(_apiServices));
    var weatherResponse = Forecast.fromJson(json.decode(response.body));
    return weatherResponse.list!;
  }

  Future<List<current.Weather>> getCurrentWeather() async {
    final response = await http.Client().get(Uri.parse(_apiServicesCurrent));
    var currentWeatherResponse =
        current.CurrentWeather.fromJson(json.decode(response.body));
    return currentWeatherResponse.weather!;
    
  }
}
