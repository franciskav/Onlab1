import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            activeTrackColor: const Color.fromRGBO(255, 79, 99, 1.0),
            inactiveTrackColor: const Color.fromRGBO(236, 236, 236, 1.0),
            thumbColor: const Color.fromRGBO(255, 79, 99, 1.0),
            overlayColor: const Color.fromRGBO(255, 181, 138, 0.2),
            trackHeight: 2.h,
            valueIndicatorColor: const Color.fromRGBO(236, 236, 236, 0.8),
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
