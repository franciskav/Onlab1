import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onlab1/config/color_constants.dart';

class CustomSlider extends StatefulWidget {
  final String label;
  final int max;
  final String? metric;

  const CustomSlider(
      {Key? key, required this.label, required this.max, this.metric })
      : super(key: key);

  @override
  _CustomRangeSlider createState() => _CustomRangeSlider(label, max, metric);
}

class _CustomRangeSlider extends State<CustomSlider> {
  String label;
  int max;
  String? metric;
  late double currentValue;

  _CustomRangeSlider(this.label, this.max, this.metric) {
    currentValue = max.toDouble();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
          child: Text(
            '$label ${currentValue.toInt()} ${metric ?? ""}'.toUpperCase(),
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: ColorConstants.primary,
            inactiveTrackColor: ColorConstants.grayLight,
            thumbColor: ColorConstants.primary,
            overlayColor: ColorConstants.primaryLightGradient,
            trackHeight: 2.h,
            valueIndicatorColor: ColorConstants.grayLight,
            valueIndicatorTextStyle: Theme.of(context).textTheme.bodyText1,
          ),
          child: Slider(
            value: currentValue,
            max: max.toDouble(),
            divisions: max,
            label: currentValue.toInt().toString(),
            onChanged: (double value) {
              setState(() {
                currentValue = value;
              });
            },
          ),
        )
      ],
    );
  }
}
