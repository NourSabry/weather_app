import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/config/services/navigation_service.dart';
import 'package:weather_app/features/detailed_weather/detailed_weather_notifier.dart';
import 'package:weather_app/features/detailed_weather/widgets/detailec_app_bar.dart';
import 'package:weather_app/features/detailed_weather/widgets/detailed_sized_box.dart';
import 'package:weather_app/features/show_weather/home_page.dart';
import 'package:weather_app/models/weather_model.dart';

class DetailedWeatherScreen extends StatefulWidget {
  static const routeName = 'detailed-screen';

  final double temp;
  final DateTime time;
  final String desc;
  final int humidity;

  const DetailedWeatherScreen({
    super.key,
    required this.temp,
    required this.time,
    required this.desc,
    required this.humidity,
  });

  @override
  State<DetailedWeatherScreen> createState() => _DetailedWeatherScreenState();
}

class _DetailedWeatherScreenState extends State<DetailedWeatherScreen> {
  late final DetailedWeatherNotifier _detailedPageNotifier =
      context.read<DetailedWeatherNotifier>();
  List<ListElement>? _list = [];

  bool _isloading = false;
  @override
  void initState() {
    fetchWeather();
    super.initState();
  }

  fetchWeather() async {
    setState(() {
      _isloading = true;
    });
    _list = await _detailedPageNotifier.getDayDetailedWeather();

    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/cloud.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  DetailedAppBAr(
                    func: () => N.offAllNamed(DubaiCityWeather.routeName),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 100.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: const Text(
                        "Dubai Detailed Weather Information",
                        style: WeatherTextStyles.normalWhiteText,
                      )),
                  Align(
                    alignment: const Alignment(0.0, 1.5),
                    child: DetailedSizedBox(
                      widget: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            leading: const Text(
                              'degrees in Kelvin?',
                            ),
                            trailing: Text(
                              widget.temp.toString(),
                            ),
                          ),
                          Center(
                            child: Text(
                              widget.time.toString(),
                              style: WeatherTextStyles.blueText,
                            ),
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    ' current weather    ${widget.desc}',
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    ' humidity    ${widget.humidity}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Stack(
              children: const [],
            ),
          ),
        ],
      ),
    );
  }
}
