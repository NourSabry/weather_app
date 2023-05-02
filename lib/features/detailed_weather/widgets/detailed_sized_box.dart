import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedSizedBox extends StatelessWidget {
  final Widget widget;
  const DetailedSizedBox({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h,
      width: 10.w,
      child: OverflowBox(
        minWidth: 0.0,
        maxWidth: MediaQuery.of(context).size.width,
        minHeight: 0.0,
        maxHeight: (MediaQuery.of(context).size.height / 4),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 5.h,
              ),
              width: double.infinity,
              height: double.infinity,
              child: Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: widget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
