import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRangeSlider extends StatefulWidget {
  final String label;
  final int min;
  final int max;
  final String? metric;

  const CustomRangeSlider(
      {Key? key,
      required this.label,
      required this.min,
      required this.max,
      this.metric})
      : super(key: key);

  @override
  _CustomRangeSlider createState() =>
      _CustomRangeSlider(label, min, max, this.metric);
}

class _CustomRangeSlider extends State<CustomRangeSlider> {
  String label;
  int min;
  int max;
  String? metric;
  late RangeValues currentValues;

  _CustomRangeSlider(this.label, this.min, this.max, this.metric) {
    currentValues = RangeValues(min.toDouble(), max.toDouble());
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
            '$label ${currentValues.start.toInt()}-${currentValues.end.toInt()} ${metric ?? ""}'
                .toUpperCase(),
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
          child: RangeSlider(
            values: currentValues,
            min: min.toDouble(),
            max: max.toDouble(),
            divisions: (max - min),
            labels: RangeLabels(
              currentValues.start.toInt().toString(),
              currentValues.end.toInt().toString(),
            ),
            onChanged: (RangeValues values) {
              setState(() {
                currentValues = values;
              });
            },
          ),
        )
      ],
    );
  }
}
