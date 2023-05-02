import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/config/constants/api.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class DetailedWeatherNotifier with ChangeNotifier {
  BuildContext context;

  DetailedWeatherNotifier({
    required this.context,
  });

  final _apiServices = ApiServices.weatherApi + ApiServices.apiKey;
  final _apiServicesCurrent = ApiServices.currentWeather + ApiServices.apiKey;

  Future<List<ListElement>> getDayDetailedWeather() async {
    final response = await http.Client().get(Uri.parse(_apiServices));
    var weatherResponse = Forecast.fromJson(json.decode(response.body));
    return weatherResponse.list!;
  }

 

}
