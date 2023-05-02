// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/config/services/navigation_service.dart';
import 'package:weather_app/features/detailed_weather/detailed_weather.dart';
import 'package:weather_app/features/show_weather/home_page_notifier.dart';
import 'package:weather_app/features/show_weather/widgets/weather_card.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class DubaiCityWeather extends StatefulWidget {
  const DubaiCityWeather({super.key});

  static const routeName = 'home_page';

  @override
  State<DubaiCityWeather> createState() => _DubaiCityWeatherState();
}

class _DubaiCityWeatherState extends State<DubaiCityWeather> {
  late final HomePageNotifier _homepageNotifier =
      context.read<HomePageNotifier>();
  List<ListElement> _list = [];

  bool _isloading = false;

  @override
  void initState() {
    getweatherData();
    super.initState();
  }

  getweatherData() async {
    setState(() {
      _isloading = true;
    });
        await Future.delayed(const Duration(milliseconds: 200));
    _list = await _homepageNotifier.getFiveDaysThreeHoursForcastData();
    setState(() {
      _isloading = false;
    });
  }

 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/sunny.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: size.width * 0.03,
              top: size.height * 0.1,
              right: size.width - size.width * 0.25,
              child: Text(
                _list[0].weather![0].description!,
                style: WeatherTextStyles.largeWhiteText,
              ),
            ),
            Positioned(
              left: size.width * 0.06,
              bottom: size.height * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dubai",
                    style: WeatherTextStyles.normalWhiteText,
                  ),
                  SizedBox(
                    width: size.width - 20.w,
                    height: 70.h,
                    child: Row(
                      children: [
                        Text(
                          _list[0].main!.temp!.toString(),
                          style: WeatherTextStyles.degreeText,
                        ),
                        SizedBox(
                          width: size.width * 0.1,
                        ),
                        _isloading
                            ? const CircularProgressIndicator()
                            : Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return WeatherCard(
                                        weather:
                                         _list[index].main!.temp!,
                                        days: DateFormat('EEEE').format(
                                          _list[index].dtTxt!,
                                        ),
                                        func: () {
                                          N.toNamed(
                                            DetailedWeatherScreen.routeName,
                                            arguments: {
                                              'temp': _list[index].main!.temp! ,
                                              'time': _list[index].dtTxt!,
                                              'desc': _list[index]
                                                  .weather![index]
                                                  .description,
                                              'humidity':
                                                  _list[index].main!.humidity,
                                            },
                                          );
                                        });
                                  },
                                  itemCount: _list.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
