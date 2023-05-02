import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/text_styles.dart';
 
class WeatherCard extends StatelessWidget {
  final void Function() func;
  final double weather;
  final String days;
   const WeatherCard({
    super.key,
    required this.func,
    required this.weather,
    required this.days,
   });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:    func ,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        width: 100.w,
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              days,
              style: WeatherTextStyles.smallGreyText,
            ),
            Text(
              weather.toString(),
              style: WeatherTextStyles.smallBlackText,
            )
          ],
        ),
      ),
    );
  }
}
